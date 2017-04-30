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
        ln -s ~/dotfiles/gitconfig ~/.gitconfig

4. Vim plugins are managed through [vim-plug](https://github.com/junegunn/vim-plug):

        curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

5. Run :PlugInstall in Vim.
