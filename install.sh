#!/bin/sh
DOTFILES_HOME=~/.dotfiles

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

[ -e "$DOTFILES_HOME/vim/vimrc" ]        && die "Kordan's dotfiles is already installed."
[ -f "$HOME/.vim" ] && [ ! -L "$HOME/.vim" ] && die "$HOME/.vim already exists."
[ -f "$HOME/.vimrc" ] && [ ! -L "$HOME/.vimrc" ] && die "$HOME/.vimrc already exists."

# Check out the prerequisites
git clone https://github.com/hitripod/dotfiles.git ~/.dotfiles
ln -sf $DOTFILES_HOME/vim ~/.vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone git://github.com/tarruda/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone git://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions


# Make the symbolic links - VIM
ln -sf ~/.dotfiles/vim/vimrc ~/.vimrc
ln -sf ~/.dotfiles/vim/gvimrc ~/.gvimrc
# Make the symbolic links - ZSH
rm -rf ~/.zshrc && ln -s ~/.dotfiles/zsh/oh-my-zsh.zshrc ~/.zshrc
ln -sf ~/.dotfiles/zsh/zshrc ~/.oh-my-zsh/custom/kordan.zsh
mkdir -p ~/.oh-my-zsh/custom/lib && \
ln -sf ~/.dotfiles/zsh/key-bindings.zsh ~/.oh-my-zsh/custom/lib/key-bindings.zsh
# Make the symbolic links - GIT
ln -sf ~/.dotfiles/git/gitconfig ~/.gitconfig
# Make the symbolic links - TMUX
ln -sf ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf
# Make the symbolic links - Misc
ln -sf ~/.dotfiles/misc/ackrc ~/.ackrc
ln -sf ~/.dotfiles/misc/profile ~/.profile

# Initilize and update those plugins using Vundle
vim +PluginInstall +qall
echo "Kordan's dotfile is installed."

clean() {
    rm -rf ~/.vimrc
    rm -rf ~/.gvimrc
    rm -rf ~/.zshrc
    rm -rf ~/.ackrc
    rm -rf ~/.profile
    rm -rf ~/.oh-my-zsh/custom/kordan.zsh
    rm -rf ~/.oh-my-zsh/custom/lib/key-bindings.zsh
    rm -rf ~/.gitconfig
    rm -rf ~/.tmux.conf
}
