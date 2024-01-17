# vim:ft=zsh ts=2 sw=2 sts=2

COLOR_1=5
COLOR_2=15

COLOR_STATUS_OK=13
COLOR_STATUS_ERR=9

COLOR_GIT_DIRTY=11
COLOR_GIT_CLEAN=10

COLOR_VENV=10

CURRENT_BG='NONE'

STARTING_SEPARATOR='\ue0b6'
SEGMENT_SEPARATOR='\ue0b0'


prompt_segment() {
  local bg fg fg_inv
  
  fg_inv="%F{$COLOR_1}"
  [[ -n $3 ]] && bg="%K{$3}" || bg="%K{$COLOR_1}"
  [[ -n $2 ]] && fg="%F{$2}" || fg="%F{$COLOR_2}"
  if [[ $CURRENT_BG != 'NONE' ]]; then
    echo -n " %{$bg%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{$fg%} "
  else
    echo -n " %{%k%}%{$fg_inv%}$STARTING_SEPARATOR%{$bg%}%{$fg%} "
  fi
  [[ -n $3 ]] && CURRENT_BG=$3 || CURRENT_BG=$COLOR_1
  if [[ -z $3 ]]; then
    local tmp=$COLOR_1
    COLOR_1=$COLOR_2
    COLOR_2=$tmp
  fi
  [[ -n $1 ]] && echo -n $1
}

prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    echo -n " %{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
    echo -n "%{%k%}"
  fi
  echo -n "%{%f%}"
  CURRENT_BG=''
}

prompt_status() {
  if [[ $? -eq 0 ]]; then
    prompt_segment " " $COLOR_STATUS_OK
  else
    prompt_segment " " $COLOR_STATUS_ERR
  fi
}

prompt_context() {
  if [[ -n "$SSH_CLIENT" ]]; then
    prompt_segment "%n@%m"
  else
    prompt_segment "%n"
  fi
}

prompt_dir() {
  prompt_segment "%(5~|%-1~/.../%3~|%4~)"
}

# Git: branch/detached head, dirty status
prompt_git() {
  (( $+commands[git] )) || return
  if [[ "$(git config --get oh-my-zsh.hide-status 2>/dev/null)" = 1 ]]; then
    return
  fi
  local PL_BRANCH_CHAR
  () {
    local LC_ALL="" LC_CTYPE="en_US.UTF-8"
    PL_BRANCH_CHAR=$'\ue0a0'         # 
  }
  local ref dirty mode repo_path

   if [[ "$(git rev-parse --is-inside-work-tree 2>/dev/null)" = "true" ]]; then
    repo_path=$(git rev-parse --git-dir 2>/dev/null)
    dirty=$(parse_git_dirty)
    ref=$(git symbolic-ref HEAD 2> /dev/null) || \
    ref="◈ $(git describe --exact-match --tags HEAD 2> /dev/null)" || \
    ref="➦ $(git rev-parse --short HEAD 2> /dev/null)" 
     
    local ahead behind
    ahead=$(git log --oneline @{upstream}.. 2>/dev/null)
    behind=$(git log --oneline ..@{upstream} 2>/dev/null)
    if [[ -n "$ahead" ]] && [[ -n "$behind" ]]; then
      PL_BRANCH_CHAR=$'\u21c5'
    elif [[ -n "$ahead" ]]; then
      PL_BRANCH_CHAR=$'\u21b1'
    elif [[ -n "$behind" ]]; then
      PL_BRANCH_CHAR=$'\u21b0'
    fi

    if [[ -e "${repo_path}/BISECT_LOG" ]]; then
      mode=" <B>"
    elif [[ -e "${repo_path}/MERGE_HEAD" ]]; then
      mode=" >M<"
    elif [[ -e "${repo_path}/rebase" || -e "${repo_path}/rebase-apply" || -e "${repo_path}/rebase-merge" || -e "${repo_path}/../.dotest" ]]; then
      mode=" >R>"
    fi

    setopt promptsubst
    autoload -Uz vcs_info

    zstyle ':vcs_info:*' enable git
    zstyle ':vcs_info:*' get-revision true
    zstyle ':vcs_info:*' check-for-changes true
    zstyle ':vcs_info:*' stagedstr '✚'
    zstyle ':vcs_info:*' unstagedstr '±'
    zstyle ':vcs_info:*' formats ' %u%c'
    zstyle ':vcs_info:*' actionformats ' %u%c'
    vcs_info

    local output_str="${${ref:gs/%/%%}/refs\/heads\//$PL_BRANCH_CHAR }${vcs_info_msg_0_%% }${mode}"

    if [[ -n $dirty ]]; then
      prompt_segment $output_str black $COLOR_GIT_DIRTY
    else
      prompt_segment $output_str black $COLOR_GIT_CLEAN
    fi
  fi
}

# Virtualenv: current working virtualenv
prompt_virtualenv() {
  if [[ -n "$VIRTUAL_ENV" && -n "$VIRTUAL_ENV_DISABLE_PROMPT" ]]; then
    prompt_segment "${VIRTUAL_ENV:t:gs/%/%%} " black $COLOR_VENV
  fi
}

build_prompt() {
  prompt_status
  prompt_virtualenv
  prompt_context
  prompt_dir
  prompt_git
  prompt_end
}

PROMPT='%{%f%b%k%}$(build_prompt) '

