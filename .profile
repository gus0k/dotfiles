export SHELL=`which zsh`
[ -z "$ZSH_VERSION" ] && exec /usr/bin/zsh -l

source $HOME/.profile
