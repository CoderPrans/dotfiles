# source ~/Documents/dotfiles/zshrc
export ZSH=/home/pranav/.oh-my-zsh

ZSH_THEME="minimal" # avit garyblessington kolo

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

export FZF_BASE="/usr/share/fzf"
# use the_silver_searcher(ag) with fzf
export FZF_DEFAULT_COMMAND='ag --hidden -p $HOME/.ignore -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--height 40%"
export FZF_ALT_C_COMMAND="find -L . -mindepth 1 \\( -path '*/\\.*' \
    -o -path '*/node_modules' -o -path '*/venv' -o -fstype 'sysfs' \
    -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) \
    -prune -o -type d -print 2> /dev/null | cut -b3-"
export FZF_ALT_C_OPTS="--preview 'tree -C -I 'node_modules' {} | head -200'"

plugins=(
  git 
  fzf
  zsh-autosuggestions
  zsh-syntax-highlighting
)

export EDITOR='vim'
export TERM='st-256color'
export XDG_CONFIG_HOME="$HOME/.config"

# pipenv will .venv in project dir
export PIPENV_VENV_IN_PROJECT=1

# deno
export DENO_INSTALL="/home/pranav/.deno"

export PATH="$DENO_INSTALL/bin:$PATH:/home/pranav/.local/bin"

source $ZSH/oh-my-zsh.sh

# zsh-syntax-highlighting
typeset -A ZSH_HIGHLIGHT_STYLES

ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=cyan'

# Example aliases
# alias lsl="ls -alh"
alias tree="tree -I 'node_modules|bin|docs|lib|build|target'"
# alias ll='colorls -lA --sd --gs --group-directories-first'
# alias ls='colorls --group-directories-first'
alias dots="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# vi mode
# bindkey '^[' vi-cmd-mode
# export KEYTIMEOUT=1

# fe [FUZZY PATTERN] - Open the selected file with the default editor
fe() {
  local files
  IFS=$'\n' files=($(fzf --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}
# fbr - choose and switch to a local or remote git branch
fbr() {
  local branches branch
  branches=$(git branch -a) && 
      branch=$(echo "$branches" | fzf +s +m -e) && 
      git checkout $(echo "$branch" | sed "s:.* remotes/origin/::" \
      | sed "s:.* ::") 
}
# pff - kills selected process
pff() {
  local process
  process=$(ps -aux | fzf) && 
      echo " Killing:  $(echo "$process" | awk '{print $2, " ", $NF}')" &&
      kill $(echo "$process" | awk '{print $2}') 
}

# using nvm
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

