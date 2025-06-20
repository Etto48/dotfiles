#!/bin/bash

set -e

echo "Installing extensions"

tmp_dir=$(mktemp -d)
trap 'rm -rf "$tmp_dir"' EXIT

if ! (command -v gnome-extensions &> /dev/null); then
    echo "gnome-extensions command not found. Please install GNOME Shell extensions support."
    exit 1
fi

install_extension() {
    local extension_name="$1"
    local extension_author="$2"
    local extension_version="$3"
    local extension_url="https://extensions.gnome.org/extension-data/${extension_name}${extension_author}.v${extension_version}.shell-extension.zip"
    local extension_file="${tmp_dir}/${extension_name}_${extension_author}_v${extension_version}.zip"
    local extension_id="${extension_name}@${extension_author}"
    local extension_fancy_name="${extension_id} v${extension_version}"
    if [ -z "$extension_name" ] || [ -z "$extension_author" ] || [ -z "$extension_version" ]; then
        echo "Invalid parameters for install_extension: $extension_name, $extension_author, $extension_version"
        return 1
    fi
    if gnome-extensions list | grep -q "${extension_id}"; then
        echo "Extension ${extension_name}@${extension_author} is already installed."
        gnome-extensions enable "$extension_id"
        return 0
    fi
    wget -q "$extension_url" -O "$extension_file"
    if [ $? -eq 0 ]; then
        echo "Installing ${extension_fancy_name}"
        if ! (gnome-extensions install "$extension_file"); then
            echo "Failed to install ${extension_fancy_name}"
            return 1
        fi
        rm "$extension_file" 
    else
        echo "Failed to download ${extension_fancy_name} from ${extension_url}"
    fi
}

install_extension openbar neuromorph 43
install_extension rounded-window-corners fxgn 12
install_extension app-hider lynith.dev 23
install_extension grand-theft-focus zalckos.github.com 8
install_extension blur-my-shell aunetx 68

echo "Applying gnome terminal settings"
dconf load /org/gnome/terminal/ < ./gnome/gnome-terminal.cfg

echo "Applying gnome extension settings"
dconf load /org/gnome/shell/extensions/dash-to-dock/ < ./gnome/dash-to-dock.cfg
dconf load /org/gnome/shell/extensions/openbar/ < ./gnome/openbar.cfg
dconf load /org/gnome/shell/extensions/tiling-assistant/ < ./gnome/tiling-assistant.cfg
dconf load /org/gnome/shell/extensions/rounded-window-corners-reborn/ < ./gnome/rounded-window-corners-reborn.cfg
dconf load /org/gnome/shell/extensions/blur-my-shell/ < ./gnome/blur-my-shell.cfg
