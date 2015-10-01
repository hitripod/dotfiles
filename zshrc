# for building Android
ulimit -S -n 1024

export GOPATH="$HOME/go:/Users/kordan/CodeProject/owl/open-falcon"
export PATH="/usr/local/bin:/opt/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/usr/games:/usr/local/sbin:/usr/X10R6/bin:/usr/local/jdk1.6.0_07/bin:/sw/bin:$HOME/android-sdk-mac_x86/platform-tools:$HOME/bin/binutils/bin:$HOME/bin:$HOME/llvm-2.8/bin:/usr/local/texlive/2010basic/bin:/Users/kordan/bin/python-client:/usr/local/texlive/2010/bin/x86_64-darwin:/usr/local/Cellar/ruby/1.9.2-p290/bin:/Developer/usr/bin:$HOME/.rvm/gems/ruby-2.0.0-p247@rails-4.0.0/bin:$GOPATH:$GOPATH/bin"
export EDITOR=vim
export LANG=en_US.UTF-8

# Don't record the duplicate command in hostory
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

UNAME=`uname`
if [[ $UNAME == "Darwin" ]]
then
#---------------------------------------------------##
#                       MAC only 
#---------------------------------------------------##
    export LSCOLORS="ExFxCxDxCxEgEdAbAgAcAd"
    export LLVM_HOME="/Users/kordan/llvm-128332-bin"
    export PYTHONPATH="/Library/Python/2.7/site-packages:$PYTHONPATH"
    alias ls='ls -Gv'
    alias sloc='cloc-1.62.pl'
    alias ll='ls -laGvh'
    alias grep='grep --color=auto'
    alias h='history'
    alias top='top -u'
    alias vi='vim'
    alias wxpython='arch -i386 python' # wxpython is now a x86 installation
    alias clang='xcrun clang --sysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.8.sdk/'
    alias clang++='xcrun clang++ --sysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.8.sdk/'
    alias wedding='rsync -avz -e "ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" --progress ~/Desktop/wedding_day-pack modcarl@troup.dreamhost.com:/home/modcarl/hitripod.com/public/marriage/20140920/'

    # Safe delete
    del() {
        mv $@ ~/.Trash
    }

    # Spotlight search
    spot () {
        mdfind -name $1
    }

    # MySQL
    mysqlservice() {
        sudo /usr/local/Cellar/mysql/5.6.22/support-files/mysql.server $@
    }

    # ZSH auto completion
    fpath=($HOME/.zsh/func $fpath)
    typeset -U fpath

    # Copy the file content
    copy() {
        cat $1 | pbcopy
    }

    run_parallel () {
        sudo kextutil "/Library/Parallels/Parallels Service.app/Contents/Kexts/10.6/prl_hypervisor.kext"&&\
        sudo kextutil "/Library/Parallels/Parallels Service.app/Contents/Kexts/10.6/prl_hid_hook.kext"&&\
        sudo kextutil "/Library/Parallels/Parallels Service.app/Contents/Kexts/10.6/prl_usb_connect.kext"&&\
        sudo kextutil "/Library/Parallels/Parallels Service.app/Contents/Kexts/10.6/prl_netbridge.kext"&&\
        sudo kextutil "/Library/Parallels/Parallels Service.app/Contents/Kexts/10.6/prl_vnic.kext"
    }

    # Set label color
    label() {
      if [ $# -lt 2 ]; then
        echo "USAGE: label [0-7] file1 [file2] ..."
        echo "Sets the Finder label (color) for files"
        echo "Default colors:"
        echo " 0  No color"
        echo " 1  Orange"
        echo " 2  Red"
        echo " 3  Yellow"
        echo " 4  Blue"
        echo " 5  Purple"
        echo " 6  Green"
        echo " 7  Gray"
      else
        osascript - "$@" << EOF
        on run argv
            set labelIndex to (item 1 of argv as number)
            repeat with i from 2 to (count of argv)
              tell application "Finder"
                  set theFile to POSIX file (item i of argv) as alias
                  set label index of theFile to labelIndex
              end tell
            end repeat
        end run
EOF
      fi
    }

    hideDesktop () {
        if [ $1 = "yes" ]; then
            defaults write com.apple.finder CreateDesktop -bool FALSE; killall Finder;
        elif [ $1 = "no" ]; then
            defaults write com.apple.finder CreateDesktop -bool TRUE; killall Finder;
        else
            echo "Usage: hideDesktop yes|no" 
        fi
    }

    sshp() {
        if [ $1 = "fwdisk" ]; then
            ssh -t -p 12321 xiecz@211.152.9.188 "sudo ssh -p12321 157.122.99.72"
        elif [ $1 = "no" ]; then
        else
            echo "Usage: sshp [fwdisk]" 
        fi
    }

    ### Init the environment setting of docker-machine
    eval $(docker-machine env dev)

    export LS_COLORS="no=00:fi=00:di=01;37:ln=01;36:\ 
    #pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:\ 
    #or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:\ 
    #*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:\ 
    #*.z=01;31:*.Z=01;31:*.gz=01;31:*.deb=01;31:\ 
    #*.jpg=01;35:*.gif=01;35:*.bmp=01;35:*.ppm=01;35:\ 
    #*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:\ 
    #*.mpg=01;37:*.avi=01;37:*.gl=01;37:*.dl=01;37:"
    
#---------------------------------------------------##
#                   End of MAC only 
#---------------------------------------------------##
elif [[ $UNAME == "Linux" ]]
then
   alias ls='ls --color=auto'
fi

#---------------------------------------------------##
#                      Kordan 
#---------------------------------------------------##

bindkey '\e[H'  beginning-of-line
bindkey '\e[F'  end-of-line
bindkey "\e[3~" delete-char
bindkey '\e[B'  history-beginning-search-forward
bindkey '\e[A'  history-beginning-search-backward

autoload -U colors && colors
#echo "$fg_bold[red]zsh $fg_no_bold[white]is $bg[blue]$fg_bold[green]nice"
          
## case-insensitive (uppercase from lowercase) completion
#zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
### case-insensitive (all) completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
### case-insensitive,partial-word and then substring completion
#zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
#
# This allows extended characters to be shown when tabbing to complete, and so on...
setopt printeightbit 

my_accounts=(
    {tom,dick,harry,root}@10.0.1.201
    {tom,dick,harry,root}@othermachine.com 
    sapporo@{ahost.com,somehost.com}
    modcarl@140.112.29.194
    admin@192.168.1.1
    admin@h.hitripod.com
    r98922097@linux2.csie.ntu.edu.tw
    modcarl@troup.dreamhost.com
    kordan@106.185.45.32
    root@h.hitripod.com
    ubuntu@54.200.200.66

    root@61.164.125.227
    root@61.164.125.228
    root@61.164.125.230
    root@61.164.125.233
    root@61.164.125.234
    root@61.164.125.235
    root@61.164.125.241
    root@61.164.125.244
    root@61.164.125.246
    root@61.164.125.252
    
    xiecz@211.152.9.188

    vm-0.kordan.koding.kd.io
    {root,kordan}@112.121.87.201
    {root,kordan}@112.121.87.202
)

zstyle ':completion:*:my-accounts' users-hosts $my_accounts
zstyle ':completion:*:(ssh|scp):*' tag-order users-hosts users hosts
zstyle ':completion:*:(ssh|scp):*' group-order users-hosts users hosts 

zmodload -i zsh/complist
export ZLS_COLORS=$LS_COLORS


# Swap the file names
swap () {
    mv $1 tmp
    mv $2 $1
    mv tmp $2
}

gg () {
    #if [ $# -eq 2 ]; then
    #    grep -rIn --color "$1" "$2" --ignore-case --exclude=tags --exclude=react-bootstrap.min.js
    #else
        grep -rIn --color $* ./* --ignore-case --exclude=tags --exclude="*.min.js" --exclude="*.min.css" --exclude="*bootstrap.js"\
            --exclude="*.min.map"
    #fi
}

gr () {
    if [ $# -ne 2 ]; then
        echo "gr [text to grep] [perl rex pattern]"
    else
        grep -r -l $1 .|sort|uniq|gxargs perl -e $2 -pi
    fi
}

# ff x find file named x
ff () {
    find . -name $1 -print
}

# files x => list files in x
files () {
    find $1 -type f -print
}

# Grep thru dictionary
word () {
    grep $* /usr/share/dict/web2
}

# Histogram words
wordcount () {
    (cat $* | tr -s ' .,;:?!()[]"' '\012' | cat -n | tail -1 | awk '{print $1}')
}

setip () {
    if [ $1 = "list" ]; then
        echo "lab, dhcp"
    elif [ $1 = "lab" ]; then
        networksetup -setmanual Ethernet 140.112.29.202 255.255.255.0 140.112.29.254
    elif [ $1 = "dhcp" ]; then
        networksetup -setdhcp Ethernet
    else
        echo "Usage: setip [list|lab|dhcp]" 
    fi
}


# Show the absolute file path
abs () {
    find $PWD -name $1
}

# adb for iPhone
adbi () {
    if [ $1 = "start-server" ]; then
        tcprelay.py -t 22:2222 & 
    elif [ $1 = "kill-server" ]; then
        kill `ps -ax|grep tcprelay|awk '{print $1}'`
    elif [ $1 = "shell" ]; then
        ssh root@localhost -p2222
    elif [ $1 = "push" ]; then
        echo "not implemented yet"
    elif [ $1 = "pull" ]; then
        echo "not implemented yet"
    else
        echo "usage: start-server, kill-server, shell"
    fi 
}

upload() {
    echo 'http://dl.dropbox.com/u/3968081/'$1 |pbcopy
}

tohtml() {
    clang -cc1 -emit-html $1>/tmp/$1.html &&
    open /tmp/$1.html
}

backup() {
    DEST="/Users/kordan/Dropbox/Career/Research/RemoteRenderScript"
    SRC="/home/modcarl/cyanogen2.3.3-new-RS-bundle/frameworks/base/libs/rs"
    rsync -av -e ssh modcarl@140.112.29.194:$SRC $DEST
    DEST="/Users/kordan/Dropbox/Career/Research/RemoteRenderScript"
    SRC="/home/modcarl/cyanogen2.3.3-new-RS-bundle/out/target/product/crespo/obj/SHARED_LIBRARIES/libRS_intermediates"
    rsync -av -e ssh modcarl@140.112.29.194:$SRC $DEST
}

## Get rid of dups in paths
typeset -U path manpath fpath #cdpath

## cd : dirs in home and one dir up
cdpath=(~ ..)

# path alias, e.g. cd ~XXX
AND_HOME="/Volumes/Android/cyanogen-passion"
hash -d PROJ="/Users/kordan//Dropbox/Career/Research/Projects/"
hash -d WORK="/Users/kordan/Practices/LexYacc/cc/FromScratch"
hash -d ACP="/Users/kordan/modcarl/Advanced Computer Programming/"
hash -d AND="$AND_HOME"
hash -d RS="$AND_HOME/frameworks/base/libs/rs"
hash -d RSJ="$AND_HOME/frameworks/base/graphics/java/android/renderscript"
hash -d RSJNI="$AND_HOME/frameworks/base/graphics/jni"
hash -d RSI="$AND_HOME/out/target/product/passion/obj/libRS_intermediates"
hash -d P="/Users/kordan/Dropbox/Career/Research/Latex/Template 拷貝/RenderScript-paper"
hash -d d="/Users/kordan/Downloads/"
hash -d KO="/Users/kordan/CodeProject/nodejs/quick-hitter"
hash -d OWL="/Users/kordan/CodeProject/owl/open-falcon"

alias hls='hash -d'

## Options
setopt  promptsubst \
cshnullglob \
extendedglob    \
histignorespace \
#correctall 

## Completions
autoload -U compinit
compinit -C
## completions ####
autoload -U zstyle+
## General completion technique
## complete as much u can ..
zstyle ':completion:*' completer _complete _list _oldlist _expand _ignored _match _approximate _prefix #_correct
## complete less
zstyle ':completion:*' completer _expand _complete _list _ignored _approximate
## complete minimal
zstyle ':completion:*' completer _complete _ignored
## formatting and messages
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format $'%{\e[0;31m%}%d%{\e[0m%}'
zstyle ':completion:*:messages' format $'%{\e[0;31m%}%d%{\e[0m%}'
zstyle ':completion:*:warnings' format $'%{\e[0;31m%}No matches for: %d%{\e[0m%}'
#zstyle ':completion:*:corrections' format $'%{\e[0;31m%}%d (errors: %e)%{\e[0m%}'
zstyle ':completion:*' group-name ''

## determine in which order the names (files) should be
## listed and completed when using menu completion.
## `size' to sort them by the size of the file
## `links' to sort them by the number of links to the file
## `modification' or `time' or `date' to sort them by the last modification time
## `access' to sort them by the last access time
## `inode' or `change' to sort them by the last inode change time
## `reverse' to sort in decreasing order
## If the style is set to any other value, or is unset, files will be
## sorted alphabetically by name.
zstyle ':completion:*' file-sort name

## how many completions switch on menu selection
## use 'long' to start menu compl. if list is bigger than screen
## or some number to start menu compl. if list has that number
## of completions (or more).
#zstyle ':completion:*' menu select=long
zstyle ':completion:*' menu yes select=5 interactive

## case-insensitive (uppercase from lowercase) completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
## case-insensitive (all) completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
## case-insensitive,partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

## offer indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

## insert all expansions for expand completer
zstyle ':completion:*:expand:*' tag-order all-expansions

## ignore completion functions (until the _ignored completer)
zstyle ':completion:*:functions' ignored-patterns '_*'

## completion caching
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path ~/.zcompcache/$HOST

## add colors to completions
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

## don't complete backup files as executables
zstyle ':completion:*:complete:-command-::commands' ignored-patterns '*\~'

## filename suffixes to ignore during completion (except after rm command)
zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns '*?.(o|c~|old|pro|zwc)'

## add colors to processes for kill completion
zstyle ':completion:*:*:kill:*:processes' command 'ps -axco pid,user,command'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

## Key bindings
bindkey "^x^e" expand-cmd-path

## recompile zsh files
src ()
{
    autoload -U zrecompile
    [ -f ~/.zshrc ] && zrecompile -p ~/.zshrc
    [ -f ~/.zshenv ] && zrecompile -p ~/.zshenv
    [ -f ~/.zcompdump ] && zrecompile -p ~/.zcompdump
    [ -f ~/.zlogin ] && zrecompile -p ~/.zlogin
    [ -f ~/.zlogout ] && zrecompile -p ~/.zlogout
    [ -f ~/.zprofile ] && zrecompile -p ~/.zprofile
    [ -f ~/.zshrc.zwc.old ] && rm -f ~/.zshrc.zwc.old
    [ -f ~/.zshenv.zwc.old ] && rm -f ~/.zshenv.zwc.old
    [ -f ~/.zcompdump.zwc.old ] && rm -f ~/.zcompdump.zwc.old
    [ -f ~/.zlogin.zwc.old ] && rm -f ~/.zlogin.zwc.old
    [ -f ~/.zlogout.zwc.old ] && rm -f ~/.zlogout.zwc.old
    [ -f ~/.zprofile.zwc.old ] && rm -f ~/.zprofile.zwc.old
}

#---------------------------------------------------##
#                  End of Kordan
#---------------------------------------------------##


# HISTORY
# number of lines kept in history
export HISTSIZE=10000
# # number of lines saved in the history after logout
export SAVEHIST=1000
# # location of history
export HISTFILE=~/.zhistory
# # append command to history file once executed
setopt INC_APPEND_HISTORY

# Disable core dumps
#limit coredumpsize 0

# vi key binding
bindkey -v
bindkey '^R' history-incremental-search-backward

setopt AUTO_PUSHD

WORDCHARS='*?_-[]~=&;!#$%^(){}<>'

# auto-completion
setopt COMPLETE_ALIASES
setopt AUTO_LIST
setopt AUTO_MENU
#setopt MENU_COMPLETE
#setopt MULTIBYTE

autoload -U compinit
compinit

# Completion caching
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path .zcache
#zstyle ':completion:*:cd:*' ignore-parents parent pwd

#Completion Options
zstyle ':completion:*:match:*' original only
zstyle ':completion::prefix-1:*' completer _complete
zstyle ':completion:predict:*' completer _complete
zstyle ':completion:incremental:*' completer _complete 
zstyle ':completion:*' completer _complete _prefix _prefix _match _approximate

# Path Expansion
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' squeeze-shlashes 'yes'
zstyle ':completion::complete:*' '\\'

#zstyle ':completion:*:*:*:default' menu yes select #interactive
zstyle ':completion:*:*:default' force-list always

# require /etc/DIR_COLORS to display colors in the completion list
[ -f /etc/DIR_COLORS ] && eval $(dircolors -b /etc/DIR_COLORS)
export ZLSCOLORS="${LS_COLORS}"
#zmodload zsh/complist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

#bindkey -M menuselect '^M' .accept-line

#compdef pkill=kill
#compdef pkill=killall
zstyle ':completion:*:*:kill:*' menu yes select interactive
zstyle ':completion:*:kill:*'   force-list always
zstyle ':completion:*:processes' command 'ps -au$USER'

# Group matches and Describe
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:descriptions' format $'\e[01;33m -- %d --\e[0m'
zstyle ':completion:*:messages' format $'\e[01;35m -- %d --\e[0m'
zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found --\e[0m'



function precmd {

    local TERMWIDTH
    (( TERMWIDTH = ${COLUMNS} - 1 ))
    
    ###
    # Truncate the path if it's too long.
    
    PR_FILLBAR=""
    PR_PWDLEN=""
    
    local promptsize=${#${(%):---(%n@%m)----}}
    local pwdsize=${#${(%):-%/}}

    if [[ "$promptsize + $pwdsize" -gt $TERMWIDTH ]]; then
    ((PR_PWDLEN=$TERMWIDTH - $promptsize))
    else
    # the width of horizontal prompt bar
    PR_FILLBAR="\${(l.(($TERMWIDTH - ($promptsize + $pwdsize)))..${PR_HBAR}.)}"
    fi
    
    ###
    # Get APM info.
    
    #if which ibam > /dev/null; then
    #PR_APM_RESULT=`ibam --percentbattery`
    #elif which apm > /dev/null; then
    #PR_APM_RESULT=`apm`
    #fi
}

setopt extended_glob
    preexec () {
    if [[ "$TERM" == "screen" ]]; then
        local CMD=${1[(wr)^(*=*|sudo|-*)]}
        echo -n "\ek$CMD\e\\"
    fi
}

setprompt () {
###
# Need this so the prompt will work.

setopt prompt_subst

###
# See if we can use colors.

autoload colors zsh/terminfo
if [[ "$terminfo[colors]" -ge 8 ]]; then
colors
fi
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
(( count = $count + 1 ))
done
PR_NO_COLOUR="%{$terminfo[sgr0]%}"

###
# See if we can use extended characters to look nicer.

typeset -A altchar
set -A altchar ${(s..)terminfo[acsc]}
PR_SET_CHARSET="%{$terminfo[enacs]%}"
PR_SHIFT_IN="%{$terminfo[smacs]%}"
PR_SHIFT_OUT="%{$terminfo[rmacs]%}"
PR_HBAR=${altchar[q]:--}
#PR_HBAR=" "
PR_ULCORNER=${altchar[l]:--}
PR_LLCORNER=${altchar[m]:--}
PR_LRCORNER=${altchar[j]:--}
PR_URCORNER=${altchar[k]:--}

###
# Decide if we need to set titlebar text.

case $TERM in
    xterm*)
        #PR_TITLEBAR=$'%{\e]0;%(!.-=*[ROOT]*=- | .)%n@%m:%~ | ${COLUMNS}x${LINES} | %y\a%}'
        PR_TITLEBAR=''
        ;;
    screen)
        PR_TITLEBAR=$'%{\e_screen \005 (\005t) | %(!.-=[ROOT]=- | .)%n@%m:%~ | ${COLUMNS}x${LINES} | %y\e\\%}'
        ;;
    *)
        PR_TITLEBAR=''
        ;;
esac

###
# Decide whether to set a screen title
if [[ "$TERM" == "screen" ]]; then
    PR_STITLE=$'%{\ekzsh\e\\%}'
else
    PR_STITLE=''
fi

# auto-completion of limited file type
compctl -g '*.tar.bz2 *.tar.gz *.bz2 *.gz *.jar *.rar *.tar *.tbz2 *.tgz *.zip *.Z' + -g '*(-/)' extract
extract() {
   if [[ -z "$1" ]] ; then
       print -P "usage: \e[1;36mextract\e[1;0m < filename >"
       print -P "       Extract the file specified based on the extension"
   elif [[ -f $1 ]] ; then
       case ${(L)1} in
           *.tar.bz2)  tar -jxvf $1    ;;
           *.tar.gz)   tar -zxvf $1    ;;
           *.bz2)      bunzip2 $1       ;;
           *.gz)       gunzip $1       ;;
           *.jar)      unzip $1       ;;
           *.rar)      unrar x $1       ;;
           *.tar)      tar -xvf $1       ;;
           *.tbz2)     tar -jxvf $1    ;;
           *.tgz)      tar -zxvf $1    ;;
           *.zip)      unzip $1          ;;
           *.Z)        uncompress $1    ;;
           *)          echo "Unable to extract '$1' :: Unknown extension"
       esac
   else
       echo "File ('$1') does not exist!"
   fi
}

###
# APM detection

#if which ibam > /dev/null; then
#PR_APM='$PR_RED${${PR_APM_RESULT[(f)1]}[(w)-2]}%%(${${PR_APM_RESULT[(f)3]}[(w)-1]})$PR_LIGHT_BLUE:'
#elif which apm > /dev/null; then
#PR_APM='$PR_RED${PR_APM_RESULT[(w)5,(w)6]/\% /%%}$PR_LIGHT_BLUE:'
#else
PR_APM=''
#fi

###
# Finally, the prompt.

# If I am using vi keys, I want to know what mode I'm currently using.
# zle-keymap-select is executed every time KEYMAP changes.
# From http://zshwiki.org/home/examples/zlewidgets
# When using the VIM mode, reset the prompt.
# Reference: http://pthree.org/2009/03/28/add-vim-editing-mode-to-your-zsh-prompt/
VIMODE=""
function zle-keymap-select {
    VIMODE="${${KEYMAP/vicmd/ [Vim]}/(main|viins)/}"
    local promptsize=${#${(%):---(%n@%m)----}}
    local pwdsize=${#${(%):-%/$VIMODE}}
    local TERMWIDTH
    (( TERMWIDTH = ${COLUMNS} - 1 ))
    PR_FILLBAR="\${(l.(($TERMWIDTH - ($promptsize + $pwdsize)))..${PR_HBAR}.)}"
    zle reset-prompt
}
zle -N zle-keymap-select
function accept_line {
    VIMODE=''
    doprompt
    builtin zle .accept-line
}
zle -N accept_line
bindkey -M vicmd "^M" accept_line

PROMPT='$PR_SET_CHARSET$PR_STITLE${(e)PR_TITLEBAR}\
$PR_CYAN$PR_SHIFT_IN$PR_ULCORNER$PR_BLUE$PR_HBAR$PR_SHIFT_OUT [\
$PR_YELLOW%(!.%SROOT%s.%n)$PR_YELLOW$PR_WHITE@$PR_BLUE%m\
$PR_BLUE]$PR_SHIFT_IN $PR_SHIFT_OUT$PR_BLUE\
$PR_YELLOW%$PR_PWDLEN$%/$VIMODE%<<\
$PR_BLUE$PR_SHIFT_IN$PR_HBAR${(e)PR_FILLBAR}$PR_CYAN$PR_URCORNER$PR_SHIFT_OUT\

$PR_CYAN$PR_SHIFT_IN$PR_LLCORNER$PR_BLUE$PR_HBAR$PR_SHIFT_OUT \
%(?..$PR_LIGHT_RED$PR_BLUE:)\
$PR_LIGHT_BLUE%(!.$PR_RED#.$PR_WHITE\$)$PR_SHIFT_IN$PR_SHIFT_OUT\
$PR_CYAN$PR_SHIFT_IN$PR_SHIFT_OUT\
$PR_NO_COLOUR '

RPROMPT=' $PR_CYAN$PR_SHIFT_IN$PR_HBAR$PR_BLUE$PR_HBAR$PR_SHIFT_OUT\
($PR_YELLOW%D{%H:%M}$PR_BLUE)$PR_SHIFT_IN$PR_HBAR$PR_CYAN$PR_LRCORNER$PR_SHIFT_OUT$PR_NO_COLOUR'

#SPROMPT='zsh: correct '%R' to '%r' ? ([Y]es/[N]o/[E]dit/[A]bort) '

PS2='$PR_CYAN$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT\
$PR_BLUE$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT(\
$PR_LIGHT_GREEN%_$PR_BLUE)$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT\
$PR_CYAN$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT$PR_NO_COLOUR '
}

setprompt

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
