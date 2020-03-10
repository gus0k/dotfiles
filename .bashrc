export SHELL=`which zsh`
[ -z "$ZSH_VERSION" ] && exec /usr/bin/zsh -l

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
