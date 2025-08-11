Kordan's dotfiles
==============
(This vimrc is largly by courtesy of vgod's vimrc)

Prerequisites
-------------

- Vundle
- oh-my-zsh
- autojump
- zsh-autosuggestions

```shell
brew install tmux go tig vim macvim
brew install zsh-syntax-highlighting cmake cscope
# Optional: Install tmux-mem-cpu-load for system monitoring in tmux status bar
brew install tmux-mem-cpu-load
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python get-pip.py
pip install virtualdev
```

The Installation Script
-----------------------

`wget -O - https://raw.githubusercontent.com/hitripod/dotfiles/master/install.sh | sh`

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
* `vS)`:      Yield Surround `( )` for the selected text.

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

`<C-y>,` to expand the abbreviation.
`<C-y>A` to add markdown format for URL.

[More Tutorials](https://raw.githubusercontent.com/mattn/emmet-vim/master/TUTORIAL)

### [YouCompleteMe](https://github.com/Valloric/YouCompleteMe)

    ~/.vim/bundle/YouCompleteMe/install.py --clang-completer --go-completer

### [Ultisnips](https://github.com/SirVer/ultisnips)

* `<c-b>`: Expand the UltiSnips in `~/.dotfiles/vim/UltiSnips/go/code.snippets`


### [Vim script for text filtering and alignment](https://github.com/godlygeek/tabular)

`:Tabularize /<delimiter>` to tabularize the text with the delimiter.

### [vim-markdown-toc](https://github.com/mzlogin/vim-markdown-toc)

Firstly, enter `:GenTocGFM` to generate ToC, and update it by `:UpdateToc`.

### [FlyGrep](https://github.com/hitripod/FlyGrep.vim)

[GitHub - mileszs/ack.vim: ](https://github.com/mileszs/ack.vim)

Vim plugin for the Perl module / CLI script `ack`. Enter `:Ack!`: searching in project on the fly with default tools.
<leader>a: trigger `:Ack!`

### [A vim plugin that adds some nice extras for working with markdown documents](https://github.com/SidOfc/mkdx)

<leader>,: Tablize your csv (only valid in `*.md`).

### Shortcuts

* `<leader>p` to toggle paste mode.
* `<leader>n` to toggle line number.
* `<leader>g` to do FlyGrep.
* `<leader>e` to run command by Vimux.
* `<C-h>`, `<C-j>`, `<C-k>`, `<C-l>` to maximize the splitted window of the left/uppper/lower/right one.
* `<leader>hon` and `<leader>hoff` to turn ON/OFF the hex mode.

TMUX Configuration
------------------

The tmux configuration has been updated for version 3.5+. Key features include:

* **Prefix key**: Changed from `Ctrl-b` to `Ctrl-a` for better Vim compatibility
* **Window splits**: 
  - `Prefix + v`: Horizontal split
  - `Prefix + b`: Vertical split (15% height)
* **Pane navigation**: `Prefix + h/j/k/l` to navigate panes with Vim keys
* **Pane resizing**: `Prefix + H/J/K/L` to resize panes
* **Copy mode**: Vi-style key bindings with macOS clipboard integration
* **Mouse support**: Fully enabled for scrolling and selection
* **Status bar**: Custom theme with system information display
* **Quick reload**: `Prefix + r` to reload configuration

Other good references
---------------------

* [vgod - 分享我的vim設定檔](http://blog.vgod.tw/2011/03/19/vimrc/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+vgod%2Fblog+%28vgod%27s+blog%29&utm_content=Google+Reader)
* [MacTalk - 终极 Shell](http://macshuo.com/?p=676)
* [Vim + Tmux](http://nicknisi.com/posts/2015-02-25-vim-tmux/)
