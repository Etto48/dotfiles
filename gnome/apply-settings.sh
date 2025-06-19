echo "Applying gnome terminal settings"
dconf load /org/gnome/terminal/ < ./gnome/gnome-terminal.cfg

echo "Applying gnome dash-to-dock settings"
dconf load /org/gnome/shell/extensions/dash-to-dock/ < ./gnome/dash-to-dock.cfg
echo "Applying gnome openbar settings"
dconf load /org/gnome/shell/extensions/openbar/ < ./gnome/openbar.cfg
dconf load /org/gnome/shell/extensions/tiling-assistant/ < ./gnome/tiling-assistant.cfg
dconf load /org/gnome/shell/extensions/rounded-window-corners-reborn/ < ./gnome/rounded-window-corners-reborn.cfg
