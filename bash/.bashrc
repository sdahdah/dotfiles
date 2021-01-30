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

# Termite ctrl-shift-t
source /etc/profile.d/vte.sh

# fasd init
eval "$(fasd --init auto)"

# Git branch
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

# Colours to use in prompt
# Tango
# creset="$(tput sgr0)"
# cbracket="$(tput bold)$(tput setaf 14)"
# cname="$(tput bold)$(tput setaf 12)"
# cdir="$(tput bold)$(tput setaf 10)"
# cgit="$(tput bold)$(tput setaf 11)"
# cpunct="$(tput sgr0)$(tput setaf 7)"

# Lucid 4
creset="$(tput sgr0)"
cbracket="$(tput sgr0)$(tput setaf 7)"
cname="$(tput sgr0)$(tput setaf 4)"
cdir="$(tput sgr0)$(tput setaf 2)"
cgit="$(tput sgr0)$(tput setaf 1)"
cpunct="$(tput sgr0)$(tput setaf 7)"

# Set prompt
PS1='\[${cbracket}\][\
\[${cname}\]\u@\h\
\[${cpunct}\]:\
\[${cdir}\]$(_dir_chomp "$(pwd)" 20)\
\[${cbracket}\]]\
\[${cgit}\]$(_parse_git_branch)\
\[${cpunct}\] $ \[${creset}\]'
