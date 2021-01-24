# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Computer-specific definitions
if [ -f ~/.bash_local ]; then
    . ~/.bash_local
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# Enable color support of ls, dir, and grep
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Useful aliases
# alias pyenvinit='eval "$(pyenv init -)"; eval "$(pyenv virtualenv-init -)"'
# alias condainit='source /opt/miniconda3/bin/activate'
# alias eot='/usr/share/doc/herbstluftwm/examples/exec_on_tag.sh'
# alias eh='/usr/share/doc/herbstluftwm/examples/exec_on_tag.sh $(herbstclient get_attr tags.focus.name)'
alias fo='detach xdg-open "$(fzf)"'

# Colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Change editor to nvim
export EDITOR="nvim"
export VISUAL="nvim"
# Change terminal to terite
export TERMINAL="termite"
# Change pager to most
# export PAGER="most"

# Bash prompt!

# Tango/vim-eldar color paette, copy-pasted from terminal.sexy
# http://tango.freedesktop.org/Tango_Icon_Theme_Guidelines#Color_Palette
# special
foreground='#babdb6'
foreground_bold='#babdb6'
cursor='#babdb6'
background='#000000'
# black
color0='#2e3436'
color8='#555753'
# red
color1='#cc0000'
color9='#ef2929'
# green
color2='#4e9a06'
color10='#8ae234'
# yellow
color3='#c4a000'
color11='#fce94f'
# blue
color4='#3465a4'
color12='#729fcf'
# magenta
color5='#75507b'
color13='#ad7fa8'
# cyan
color6='#06989a'
color14='#34e2e2'
# white
color7='#d3d7cf'
color15='#eeeeec'

# Fancy bash prompt with git branch
_parse_git_branch () {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Directory shortener
# https://stackoverflow.com/questions/3497885/code-challenge-bash-prompt-path-shortener
_dir_chomp () {
    local p=${1/#$HOME/\~} b s
    s=${#p}
    while [[ $p != "${p//\/}" ]]&&(($s>$2))
    do
        p=${p#/}
        [[ $p =~ \.?. ]]
        b=$b/${BASH_REMATCH[0]}
        p=${p#*/}
        ((s=${#b}+${#p}))
    done
    echo ${b/\/~/\~}${b+/}$p
}

# Colour format conversion
# https://stackoverflow.com/questions/7253235/convert-hexadecimal-color-to-decimal-rgb-values-in-unix-shell-script
_hex_to_rgb () {
    printf "%d;%d;%d\n" 0x${1:1:2} 0x${1:3:2} 0x${1:5:2}
}

# Colour code generation
# https://superuser.com/questions/1220633/true-colors-in-bash-prompt
_color_code () {
    printf "\x1b[38;2;$(_hex_to_rgb $1)m"
}


# Colours to use in prompt
creset=$(printf '\x1b[0m')
cbracket="$(tput bold)$(_color_code ${color6})"
cname="$(tput bold)$(_color_code ${color4})"
cdir="$(tput bold)$(_color_code ${color2})"
cgit="$(tput bold)$(_color_code ${color3})"
cnorm="$(tput sgr0)$(_color_code ${color7})"

# Set prompt
PS1='\[${cbracket}\][\
\[${cname}\]\u@\h\
\[${cnorm}\]:\
\[${cdir}\]$(_dir_chomp "$(pwd)" 20)\
\[${cbracket}\]]\
\[${cgit}\]$(_parse_git_branch)\
\[${cnorm}\] $ '

# Termite ctrl-shift-t
source /etc/profile.d/vte.sh

# fasd init
eval "$(fasd --init auto)"
