#!/bin/bash

echo "Installing extensions"

if ! (command -v gnome-extensions &> /dev/null); then
    echo "gnome-extensions command not found. Please install GNOME Shell extensions support."
    exit 1
fi

install_extension() {
    local extension_name="$1"
    local extension_author="$2"
    local extension_id="${extension_name}@${extension_author}"

    if gnome-extensions list | grep -q "${extension_id}"; then
        echo "Extension ${extension_name} by ${extension_author} is already installed."
        return 0
    fi

    if ! (gdbus call --session \
           --dest org.gnome.Shell.Extensions \
           --object-path /org/gnome/Shell/Extensions \
           --method org.gnome.Shell.Extensions.InstallRemoteExtension \
           ${extension_id} &> /dev/null); then
        echo "Failed to install extension: ${extension_name} by ${extension_author}"
        return 1
    else
        echo "Successfully installed extension: ${extension_name} by ${extension_author}"
    fi
}

install_extension openbar neuromorph
install_extension rounded-window-corners fxgn
install_extension app-hider lynith.dev
install_extension grand-theft-focus zalckos.github.com
install_extension blur-my-shell aunetx

echo "Applying gnome terminal settings"
dconf load /org/gnome/terminal/ < ./gnome/gnome-terminal.cfg

echo "Applying gnome extension settings"
dconf load /org/gnome/shell/extensions/dash-to-dock/ < ./gnome/dash-to-dock.cfg
dconf load /org/gnome/shell/extensions/openbar/ < ./gnome/openbar.cfg
dconf load /org/gnome/shell/extensions/tiling-assistant/ < ./gnome/tiling-assistant.cfg
dconf load /org/gnome/shell/extensions/rounded-window-corners-reborn/ < ./gnome/rounded-window-corners-reborn.cfg
dconf load /org/gnome/shell/extensions/blur-my-shell/ < ./gnome/blur-my-shell.cfg
