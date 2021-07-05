# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
export PATH=$HOME/.local/bin:$HOME/bin:$HOME/.gem/ruby/2.7.0/bin:$PATH
# Fix QT cursor size bug
export XCURSOR_SIZE=24
# Disable DRI3
# https://wiki.archlinux.org/title/Intel_graphics
export LIBGL_DRI3_DISABLE=1

[[ $XDG_VTNR -le 2 ]] && tbsm
