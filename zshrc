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

export PATH=~/go/bin:$PATH
export GOPATH=~/go

export EDITOR='vim'
export VISUAL='vim'

#
# Source local changes
#
if [[ -s "${HOME}/.zshrc.local" ]]; then
  source "${HOME}/.zshrc.local"
fi
