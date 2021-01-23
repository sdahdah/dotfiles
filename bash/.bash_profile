# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.gem/ruby/2.7.0/bin:$PATH

[[ $XDG_VTNR -le 2 ]] && tbsm
