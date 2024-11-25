# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export PATH=$PATH:/home/ettore/.local/bin

# Override the default python virtualenv prompt
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Select my custom theme
ZSH_THEME="arcticglow"

plugins=(git)

# Start Oh My Zsh
source $ZSH/oh-my-zsh.sh

alias python=python3
alias ipython=ipython3
alias pip=pip3

# alias for activating virtualenv
activate() {
    if [ -z "$1" ]; then
        source ".venv/bin/activate"
    else
        source $1/bin/activate
    fi
}

eval "$(zoxide init zsh --cmd cd)"
