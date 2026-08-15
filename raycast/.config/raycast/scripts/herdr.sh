#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Herdr
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🐑
# @raycast.packageName Development

if osascript <<'APPLESCRIPT' >/dev/null 2>&1
tell application "Ghostty"
    set matches to every terminal whose name is "Herdr"

    if (count of matches) = 0 then
        error "Herdr not found"
    end if

    focus item 1 of matches
end tell
APPLESCRIPT
then
    exit 0
fi

open -n -a Ghostty --args \
  --config-file="$HOME/.config/ghostty/herdr-config" \
  -e herdr
