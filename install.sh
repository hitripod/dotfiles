#!/bin/sh
VIMHOME=~/.vim

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

[ -e "$VIMHOME/vimrc" ] && die "$VIMHOME/vimrc already exists."
[ -e "~/.vim" ] && die "~/.vim already exists."
[ -e "~/.vimrc" ] && die "~/.vimrc already exists."

# Check out the prerequisites
git clone https://github.com/hitripod/dotfiles.git ~/.vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone git://github.com/tarruda/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone git://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Make the symbolic links
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc
ln -s ~/.vim/oh-my-zsh.zshrc ~/.zshrc
ln -s ~/.vim/zshrc ~/.oh-my-zsh/custom/kordan.zsh
ln -s ~/.vim/key-bindings.zsh /Users/kordan/.oh-my-zsh/custom/lib/key-bindings.zsh
ln -s ~/.vim/gitconfig ~/.gitconfig

# Initilize and update those plugins using Vundle
vim +PluginInstall +qall
echo "Kordan's dotfile is installed."
