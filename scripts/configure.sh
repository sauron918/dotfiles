#!/usr/bin/env bash

echo "Configuring..."

# macOS

# disables the press-and-hold feature for keys (e.g. for é, ê) in favor of key repeat, default: true
defaults write -g ApplePressAndHoldEnabled -bool false

# sets key repeat rate (lower is faster), default: 2 (2 ms delay between repeats)
defaults write -g KeyRepeat -int 1

# sets delay until key repeat (lower is faster), default: 15 (150 ms delay before repeat starts)
defaults write -g InitialKeyRepeat -int 13

# by default, macOS intentionally adds a small delay (~150–300 ms) when pressing Caps Lock to prevent accidental activation
# with 0 → Caps Lock toggles instantly on tap
# /usr/bin/hidutil property --set '{"CapsLockDelayOverride":0}'

# add user-scoped LaunchAgent (not a system daemon)
# the plist runs hidutil property --set '{"CapsLockDelayOverride":0}' at every login
# settings don't persist across reboots, so the agent just re-applies the tweak at every login
PLIST="$HOME/Library/LaunchAgents/com.user.capslockdelay.plist"
mkdir -p "$HOME/Library/LaunchAgents"
cat > "$PLIST" <<'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
 "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>Label</key>
    <string>com.user.capslockdelay</string>

    <key>ProgramArguments</key>
    <array>
      <string>/usr/bin/hidutil</string>
      <string>property</string>
      <string>--set</string>
      <string>{"CapsLockDelayOverride":0}</string>
    </array>

    <key>RunAtLoad</key>
    <true/>
  </dict>
</plist>
EOF

# Load (or reload) it immediately
launchctl bootout gui/$(id -u) "$PLIST" 2>/dev/null || true
launchctl bootstrap gui/$(id -u) "$PLIST"
launchctl kickstart -k gui/$(id -u)/com.user.capslockdelay

# disable Spotlight indexing
sudo mdutil -a -i off

echo "Done!"
