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

# Fancy bash prompt with git branch
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
PS1='\[\033[36m\][\[\033[m\]\[\033[34m\]\u@\h\[\033[m\]:\[\033[32m\]\W\[\033[m\]\[\033[36m\]]\[\033[33m\]$(parse_git_branch)\[\033[00m\] $ '

# For termite ctrl-shift-t
source /etc/profile.d/vte.sh

eval "$(fasd --init auto)"
