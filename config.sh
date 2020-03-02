git remote set-url origin git@github.com:gus0k/dotfiles.git

chmod 700 $HOME
chmod 700 $HOME/.ssh

sudo ln -sf $DOTFILES/utils/latex_docker.sh $HOME/bin/latexmk
sudo ln -sf $DOTFILES/i3 $HOME/.i3
sudo ln -sf $DOTFILES/ranger $HOME/.config
sudo ln -sf $DOTFILES/ssh-config $HOME/.ssh/config
sudo ln -sf $DOTFILES/.tmux $HOME/.tmux.conf

chmod 600 $DOTFILES/ssh-config
chmod 600 $HOME/.ssh/config
