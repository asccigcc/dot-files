#!/bin/sh
# Wi-Fi name when the OS will tell us, LAN IP otherwise, "off" when down.
#
# macOS 14.4 removed the `airport` binary, and 14+ gates the SSID behind
# Location Services: without that grant ipconfig reports "<redacted>"
# and networksetup falsely claims we aren't associated. So we probe for
# a name and fall back to the IP, which never needs permission.
off='#[fg=colour203]off'
ssid=""; ip=""

case "$(uname -s)" in
  Darwin)
    iface=$(route -n get default 2>/dev/null | awk '/interface:/{print $2; exit}')
    [ -n "$iface" ] || { printf '%s' "$off"; exit 0; }
    ip=$(ipconfig getifaddr "$iface" 2>/dev/null)
    # Match " SSID" but not "BSSID"; trim surrounding blanks.
    ssid=$(ipconfig getsummary "$iface" 2>/dev/null \
           | awk -F' : ' '/[^B]SSID/ {gsub(/^ +| +$/,"",$2); print $2; exit}')
    ;;
  Linux)
    iface=$(ip route show default 2>/dev/null | awk '/default/{print $5; exit}')
    [ -n "$iface" ] || { printf '%s' "$off"; exit 0; }
    ip=$(ip -4 -o addr show dev "$iface" 2>/dev/null \
         | awk '{split($4,a,"/"); print a[1]; exit}')
    if command -v iwgetid >/dev/null 2>&1; then
      ssid=$(iwgetid -r 2>/dev/null)
    elif command -v nmcli >/dev/null 2>&1; then
      ssid=$(nmcli -t -f active,ssid dev wifi 2>/dev/null \
             | awk -F: '/^yes:/{print $2; exit}')
    fi
    ;;
  *) exit 0 ;;
esac

[ -n "$ip" ] || { printf '%s' "$off"; exit 0; }
case "$ssid" in
  ""|"<redacted>"|"not associated") printf '#[fg=colour245]%s' "$ip" ;;
  *) printf '#[fg=colour151]%.18s' "$ssid" ;;
esac
