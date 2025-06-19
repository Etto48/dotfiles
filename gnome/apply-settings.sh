echo "Enabling extensions"
echo "Install any missing extensions from https://extensions.gnome.org"
gnome-extensions enable openbar@neuromorph
gnome-extensions enable rounded-window-corners@fxgn
gnome-extensions enable app-hider@lynith.dev
gnome-extensions enable grand-theft-focus@zalckos.github.com

echo "Applying gnome terminal settings"
dconf load /org/gnome/terminal/ < ./gnome/gnome-terminal.cfg

echo "Applying gnome extension settings"
dconf load /org/gnome/shell/extensions/dash-to-dock/ < ./gnome/dash-to-dock.cfg
dconf load /org/gnome/shell/extensions/openbar/ < ./gnome/openbar.cfg
dconf load /org/gnome/shell/extensions/tiling-assistant/ < ./gnome/tiling-assistant.cfg
dconf load /org/gnome/shell/extensions/rounded-window-corners-reborn/ < ./gnome/rounded-window-corners-reborn.cfg
