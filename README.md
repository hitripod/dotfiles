Kordan's dotfiles
==============
(This vimrc is largly by courtesy of vgod's vimrc)

Prerequisites
-------------

- Vundle
- oh-my-zsh
- autojump
- zsh-autosuggestions


Installation
--------------------------------------------------

```bash
# Check out the prerequisites
cd ~
git clone https://github.com/hitripod/vimrc.git ~/.vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone git://github.com/tarruda/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone git://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
cd ~/.vim
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
```

PLUGINS
-------

* [vundle](http://www.github.com/gmarik/vundle): The VIM plug-in manager.

* [Ctrl-P](http://www.github.com/kien/ctrlp.vim.git): Fuzzy file, buffer, mru, tag, etc finder. 
    
    Press `,t` to do the fuzzy search. 

* [VIM Powerline](http://www.github.com/Lokaltog/vim-powerline): The ultimate vim statusline utility. 

* [NERD Tree](http://www.github.com/scrooloose/nerdtree): A tree explorer plugin for vim.

    Press `F2` to show up the explorer.

* [VIM Surround](http://www.github.com/tpope/vim-surround): Make quoting/parenthesizing simpler.

    * `cs"'`:      Change Surround from `"` to `'`.
    * `ds"`:       Change Surround `"`.
    * `ysiw]`:     Yield Surround `[ ]` in the word.
    * `ysiw<em>`:  Yield Surround `<em></em>` for the entire line.
    * `yss)`:      Yield Surround `( )` for the entire line.

* [Indexed Search](http://www.github.com/henrik/vim-indexed-search): Show "Match 123 of 456 /search term/" in Vim searches.

* [SuperTab](http://www.github.com/ervandew/supertab): Perform all your vim insert mode completions with Tab.

* [CloseTag](http://www.github.com/vim-scripts/closetag.vim): Functions and mappings to close open HTML/XML tags.

    Press `Ctrl + _` to insert the tag not closed.

* [VisIncr](http://www.github.com/vim-scripts/VisIncr): The visincr plugin facilitates making a column of increasing or decreasing
numbers, dates, or daynames.

    Using the visual-block to select the column you want to append the column number at the beginning of each line, and press `:IO`.

* [Ctags](http://www.github.com/vim-scripts/ctags.vim): Display function name in the title bar.
* [Taglist](http://www.github.com/vim-scripts/taglist.vim): Source code browser.
    
    Press `F1` to show the symbol list.

* [Cscope](http://www.github.com/vim-scripts/cscope.vim)

    `<leader>fs`: Find this definition
    `<leader>fg`: Find functions called by this function
    `<leader>fd`: Find functions calling this function
    `<leader>fc`: Find this text string
    `<leader>ft`: Find this egrep pattern
    `<leader>fe`: Find this file
    `<leader>ff`: Find files #including this file
    `<leader>fi`: Find files #including this file
    `<leader>l` : call ToggleLocationList()

Other good references
---------------------

* http://blog.vgod.tw/2011/03/19/vimrc/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+vgod%2Fblog+%28vgod%27s+blog%29&utm_content=Google+Reader
* http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
* http://macshuo.com/?p=676


