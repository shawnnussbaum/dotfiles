#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

autoload -Uz promptinit
promptinit
prompt agnoster-py

# Disable flow control commands (keeps C-s from freezing everything)
stty start undef
stty stop undef

# Don't share history across window sessions
unsetopt SHARE_HISTORY

export PATH=~/go/bin:$PATH
export GOPATH=~/go

export EDITOR='vim'
export VISUAL='vim'

alias g='git'
alias v='vim'
alias t='tmux'
alias ta='tmux a -d'

# Setup fzf
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="$PATH:/usr/local/opt/fzf/bin"
fi
# Auto-completion
# [[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null
# Key bindings
source "/usr/local/opt/fzf/shell/key-bindings.zsh"

#
# Source local changes
#
if [[ -s "${HOME}/.zshrc.local" ]]; then
  source "${HOME}/.zshrc.local"
fi
