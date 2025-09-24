# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export GTK_PATH=""

export PATH=$PATH:/home/ettore/.local/bin

# Override the default python virtualenv prompt
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Select my custom theme
ZSH_THEME="arcticglow"

plugins=(git)

# Start Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Install Ruby Gems to ~/.local/share/gems
export GEM_HOME="$HOME/.local/share/gems"
export PATH="$HOME/.local/share/gems/bin:$PATH"

alias python=python3
alias ipython=ipython3
alias pip=pip3
alias java8=/usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java

# alias for activating virtualenv
activate() {
    if [ -z "$1" ]; then
        source ".venv/bin/activate"
    else
        source $1/bin/activate
    fi
}

if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init zsh --cmd cd)"
fi
