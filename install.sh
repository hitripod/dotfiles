#!/bin/sh
VIMHOME=~/.vim

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

[ -e "$VIMHOME/vimrc" ]                 && die "Kordan's dotfiles is already installed."
[ -f "~/.vim" ] && [ ! -L "~/.vim" ]    && die "~/.vim already exists."
[ -f "~/.vimrc"] && [ ! -L "~/.vimrc" ] && die "~/.vimrc already exists."

# Check out the prerequisites
git clone https://github.com/hitripod/dotfiles.git ~/.vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone git://github.com/tarruda/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone git://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Make the symbolic links
ln -sf ~/.vim/vimrc ~/.vimrc ||
ln -sf ~/.vim/gvimrc ~/.gvimrc
rm -rf ~/.zshrc && ln -s ~/.vim/zsh/oh-my-zsh.zshrc ~/.zshrc 
ln -sf ~/.vim/zsh/zshrc ~/.oh-my-zsh/custom/kordan.zsh
mkdir -p ~/.oh-my-zsh/custom/lib && ln -sf ~/.vim/zsh/key-bindings.zsh ~/.oh-my-zsh/custom/lib/key-bindings.zsh
ln -sf ~/.vim/git/gitconfig ~/.gitconfig

# Initilize and update those plugins using Vundle
vim +PluginInstall +qall
echo "Kordan's dotfile is installed."
