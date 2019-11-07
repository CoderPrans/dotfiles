export ZSH=/home/pranav/.oh-my-zsh

ZSH_THEME="powerlevel10k/powerlevel10k" # avit garyblessington kolo

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

export FZF_BASE="/usr/share/fzf"
# use the_silver_searcher(ag) with fzf
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

plugins=(
  git 
  fzf
)

export EDITOR='vim'

# pipenv will .venv in project dir
export PIPENV_VENV_IN_PROJECT=1

source $ZSH/oh-my-zsh.sh

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
# export ARCHFLAGS="-arch x86_64"
# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"
# Example aliases
# alias lsl="ls -alh"
alias tree="tree -I 'node_modules|bin|docs|lib|build'"
alias ll='colorls -lA --sd --gs --group-directories-first'
alias ls='colorls --group-directories-first'
