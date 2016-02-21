Kordan's dotfiles
==============
(This vimrc is largly by courtesy of vgod's vimrc)

Prerequisites
-------------

- Vundle
- oh-my-zsh
- autojump
- zsh-autosuggestions


The Installation Script
-----------------------

`wget -O - https://raw.githubusercontent.com/hitripod/dotfiles/master/install.sh | sh`

OR

```bash
# Check out the prerequisites
git clone https://github.com/hitripod/dotfiles.git ~/.vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone git://github.com/tarruda/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone git://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Make the symbolic links
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc
rm -rf ~/.zshrc && ln -s ~/.vim/zsh/oh-my-zsh.zshrc ~/.zshrc
ln -s ~/.vim/zsh/zshrc ~/.oh-my-zsh/custom/kordan.zsh
mkdir -p ~/.oh-my-zsh/custom/lib && ln -s ~/.vim/zsh/key-bindings.zsh ~/.oh-my-zsh/custom/lib/key-bindings.zsh
ln -s ~/.vim/git/gitconfig ~/.gitconfig

# Initilize and update those plugins using Vundle
vim +PluginInstall +qall
```

PLUGINS
-------


### [Ctrl-P](http://www.github.com/kien/ctrlp.vim.git): Fuzzy file, buffer, mru, tag, etc finder. 
    
Press `,t` to do the fuzzy search. 

### [VIM Surround](http://www.github.com/tpope/vim-surround): Make quoting/parenthesizing simpler.

* `cs"'`:      Change Surround from `"` to `'`.
* `ds"`:       Change Surround `"`.
* `ysiw]`:     Yield Surround `[ ]` in the word.
* `ysiw<em>`:  Yield Surround `<em></em>` for the entire line.
* `yss)`:      Yield Surround `( )` for the entire line.

### [SuperTab](http://www.github.com/ervandew/supertab): Perform all your vim insert mode completions with Tab.

* `<C-Tab>`:    next tab
* `<C-S-Tab>`:  previous tab
* `<C-t><C-t>`: open a new tab
* `<C-t><C-w>`: close the tab

### [CloseTag](http://www.github.com/vim-scripts/closetag.vim): Functions and mappings to close open HTML/XML tags.

Press `Ctrl + _` to insert the HTML/XML tag not closed.

### [NERD Tree](http://www.github.com/scrooloose/nerdtree): A tree explorer plugin for vim.

Press `F1` to show up the explorer.

### [Taglist](http://www.github.com/vim-scripts/taglist.vim): Source code browser.
    
Press `F2` to show the symbol list.

### [Cscope](http://www.github.com/vim-scripts/cscope.vim) and [Ctags](http://www.github.com/vim-scripts/ctags.vim): Display function name in the title bar.

Execute `cscope -bqR && ctags -R *` at your project root.

* `<leader>fs`: Find this definition
* `<leader>fg`: Find functions called by this function
* `<leader>fd`: Find functions calling this function
* `<leader>fc`: Find this text string
* `<leader>ft`: Find this egrep pattern
* `<leader>fe`: Find this file
* `<leader>ff`: Find files #including this file
* `<leader>fi`: Find files #including this file
* `<leader>l` : call ToggleLocationList()

### [Emmet](https://github.com/mattn/emmet-vim)

`<C-y>,` to expand the abbreviation. [More Tutorials](https://raw.githubusercontent.com/mattn/emmet-vim/master/TUTORIAL)

### Shortcuts

* `<leader>p` to toggle paste mode.
* `<leader>n` to toggle line number.
* `<C-h>`, `<C-j>`, `<C-k>`, `<C-l>` to maximize the splitted window of the left/uppper/lower/right one.
* `<leader>hon` and `<leader>hoff` to turn ON/OFF the hex mode.

Other good references
---------------------

* [vgod - 分享我的vim設定檔](http://blog.vgod.tw/2011/03/19/vimrc/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+vgod%2Fblog+%28vgod%27s+blog%29&utm_content=Google+Reader)
* [MacTalk - 终极 Shell](http://macshuo.com/?p=676)
* [Vim + Tmux](http://nicknisi.com/posts/2015-02-25-vim-tmux/)
