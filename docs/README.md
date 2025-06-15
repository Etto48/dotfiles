# Ettore's Dotfiles

This repository contains my dotfiles. I use [GNU Stow](https://www.gnu.org/software/stow/) to manage them.

## Installation

- Clone this repository:

```bash
git clone https://github.com/Etto48/dotfiles.git ~/.dotfiles
```

- Install the dotfiles using GNU Stow:

```bash
cd ~/.dotfiles
stow *
```

- Install gnome-terminal profile:

```bash
dconf load /org/gnome/terminal/ < ./gnome-terminal/settings.cfg
```
