Dotfiles
========

Configuration files from my home directory.

Installation
------------

  1. Install zsh and [Prezto](https://github.com/sorin-ionescu/prezto)

  2. Clone the repository:

        git clone https://github.com/shawnnussbaum/dotfiles ~/dotfiles

  3. Create the links:

        ln -s ~/dotfiles/zpreztorc ~/.zpreztorc
        ln -s ~/dotfiles/zshrc ~/.zshrc
        ln -s ~/dotfiles/agnoster-py.zsh-theme ~/.zprezto/modules/prompt/functions/prompt_agnoster-py_setup
        ln -s ~/dotfiles/vimrc ~/.vimrc
        ln -s ~/dotfiles/tmux.conf ~/.tmux.conf

  4. Vim plugins are managed through Vundle:

        git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

  5. Run :BundleInstall in Vim.
