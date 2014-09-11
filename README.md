Kordan's vimrc
==============
Author: Kordan Ou 
(This vimrc is largly by courtesy of vgod's vimrc)

Installing your Vim environment on another machine
--------------------------------------------------

1. Check out from github

        $ cd ~
        $ git clone http://github.com/modcarl/vimrc.git ~/.vim
        $ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/vundle
        $ cd ~/.vim

2. Symbolic Link

        $ ln -s ~/.vim/vimrc ~/.vimrc
        $ ln -s ~/.vim/gvimrc ~/.gvimrc
        $ ln -s ~/.vim/zshrc ~/.zshrc
        $ ln -s ~/.vim/gitconfig ~/.gitconfig

3. Initilize and update those plugins using Vundle

        $ vim 
        And enter `:BundleInstall`

4. Build for command-t

        $ cd ~/.vim/bundle/command-t/ruby/command-t
        $ ruby extconf.rb 
        $ make 

UPGRADE PLUGIN BUNDLES
----------------------

Except for:
1. vimball
2. plist
3. taglist-plus

All plugins were checked out as git submodules, 
which can be upgraded with `git pull`. For example, to upgrade Command-T 

     $ cd ~/.vim/bundle/command-t
     $ git pull


PLUGINS
-------

* [Pathogen](http://www.vim.org/scripts/script.php?script_id=2332): Pathogen let us install a plugin as a bundle in ~/.vim/bundle seprately.

* [xmledit](http://www.vim.org/scripts/script.php?script_id=301): XML/HTML tags will be completed automatically.

* [Command-T](https://github.com/wincent/Command-T): open and navigate between files with `cmd-t`.
  
* [SuperTab](http://www.vim.org/scripts/script.php?script_id=1643): Do all your insert-mode completion with Tab.

* [snipMate](http://www.vim.org/scripts/script.php?script_id=2540): TextMate-style snippets for Vim

  `:help snipMate` to see more info.

* [YankRing](http://www.vim.org/scripts/script.php?script_id=1234): Maintains a history of previous yanks, changes and deletes 
  
  `:help yankring` to see more info.

* [VisIncr](http://www.vim.org/scripts/script.php?script_id=670): Produce increasing/decreasing columns of numbers, dates, or daynames.
  
* [Cute Error Marker](http://www.vim.org/scripts/script.php?script_id=2653): showing error and warning icons on line.
  
   Note: MacVim users need to enable "Use experimental renderer" to see
   graphical icons.

* [vim-latex](http://vim-latex.sourceforge.net/): Latex support.

* [OmniCppComplete](http://www.vim.org/scripts/script.php?script_id=1520): C/C++ omni-completion with ctags database.

* [JavaComplete](http://www.vim.org/scripts/script.php?script_id=1785): Java Omni-completion.

* [Clang Complete](http://www.vim.org/scripts/script.php?script_id=3302): Using clang for accurately completing C, C++, Obj-C.

* [fugitive](http://www.vim.org/scripts/script.php?script_id=2975): A Git wrapper.

* [NERD Tree](http://www.vim.org/scripts/script.php?script_id=1658): A tree explorer plugin for navigating the filesystem.

* [Vimball](http://www.vim.org/scripts/script.php?script_id=1502): A vim-based archiver: builds, extracts, and previews.

* [plist](http://www.vim.org/scripts/script.php?script_id=1223): Old-Style ASCII Property List 

* [Taglist](http://www.vim.org/scripts/script.php?script_id=273): Source code browser (supports C/C++, java, perl, python, tcl, sql, php, etc) 

* [Taglist-plus](http://www.vim.org/scripts/script.php?script_id=3504): Source code browser with awesome Javascript support

* [IndexedSearch](http://www.vim.org/scripts/script.php?script_id=1682): shows 'Nth match out of M' at every search (index of match+total # matches) 

* [pyflake](http://www.vim.org/scripts/script.php?script_id=2441): PyFlakes on-the-fly Python code checking (:cc for quickfix)

* [gtags](http://www.vim.org/scripts/script.php?script_id=893): Integrates GNU GLOBAL source code tag system with VIM. 

Language specific supports
--------------------------

* Latex: Read `:help latex-suite.txt`
* Restructured Text: `ctrl-u 1~5` inserts Part/Chapter/Section headers
* HTML, Javascript, Python, CSS, C, C++, Java: use `TAB` to do omni-completion.
* HTML/XML: End tags are automatically completed after typing a begin tag. (Typing > twice pushes the end tag to a new line.)

Other good references
---------------------

* http://blog.vgod.tw/2011/03/19/vimrc/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+vgod%2Fblog+%28vgod%27s+blog%29&utm_content=Google+Reader
* http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
