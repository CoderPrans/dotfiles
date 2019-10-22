export ZSH=/home/pranav/.oh-my-zsh

ZSH_THEME="garyblessington" # garyblessington kolo

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

export FZF_BASE="/usr/share/fzf"
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

plugins=(
  git 
  fzf
)

source $ZSH/oh-my-zsh.sh

export EDITOR='vim'

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
# export ARCHFLAGS="-arch x86_64"
# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"
# Example aliases
# alias ls="ls -alh"
