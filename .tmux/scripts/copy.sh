#!/bin/sh
# Reads the tmux selection on stdin, hands it to the platform clipboard.
# Probing for the binary beats branching on uname: it also gets Wayland
# vs X11 right, and degrades quietly on a headless box.
if   command -v pbcopy >/dev/null 2>&1; then exec pbcopy
elif [ -n "$WAYLAND_DISPLAY" ] && command -v wl-copy >/dev/null 2>&1; then exec wl-copy
elif command -v xclip  >/dev/null 2>&1; then exec xclip -selection clipboard -i
elif command -v xsel   >/dev/null 2>&1; then exec xsel --clipboard --input
else cat >/dev/null   # no clipboard: tmux's own buffer still holds it
fi
