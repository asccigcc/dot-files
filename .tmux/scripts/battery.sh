#!/bin/sh
# Battery percentage, colour-coded. Silent (prints nothing) on a machine
# without one, so the status bar just closes the gap.
pct=""; ac=0

case "$(uname -s)" in
  Darwin)
    # One pmset call feeds both the percentage and the charge state.
    out=$(pmset -g batt 2>/dev/null) || exit 0
    pct=$(printf '%s' "$out" | sed -n 's/.*[^0-9]\([0-9][0-9]*\)%.*/\1/p' | head -1)
    case "$out" in *"AC Power"*) ac=1 ;; esac
    ;;
  Linux)
    # Plain sysfs reads -- no subprocess at all, cheaper than macOS.
    for d in /sys/class/power_supply/BAT* /sys/class/power_supply/CMB*; do
      [ -r "$d/capacity" ] || continue
      pct=$(cat "$d/capacity" 2>/dev/null)
      case "$(cat "$d/status" 2>/dev/null)" in Charging|Full) ac=1 ;; esac
      break
    done
    ;;
  *) exit 0 ;;
esac

case "$pct" in ''|*[!0-9]*) exit 0 ;; esac

[ "$ac" -eq 1 ] && icon="+" || icon=""
if   [ "$pct" -le 15 ]; then col=colour203
elif [ "$pct" -le 35 ]; then col=colour215
else                        col=colour151
fi
printf '#[fg=%s]%s%s%%' "$col" "$icon" "$pct"
