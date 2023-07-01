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
prompt pure
prompt_newline='%666v'
PROMPT=" $PROMPT"

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
alias c='clear'

# Auto-completion
# [[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null
# Key bindings
source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"

#
# Source local changes
#
if [[ -s "${HOME}/.zshrc.local" ]]; then
  source "${HOME}/.zshrc.local"
fi
