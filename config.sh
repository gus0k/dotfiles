git remote set-url origin git@github.com:gus0k/dotfiles.git

chmod 700 $HOME
chmod 700 $HOME/.ssh

sudo ln -sf $DOTFILES/utils/latex_docker.sh /usr/local/bin/latexmk
sudo ln -sf $DOTFILES/i3 $HOME/.i3
sudo ln -sf $DOTFILES/ssh-config $HOME/.ssh/config

chmod 600 $DOTFILES/ssh-config
chmod 600 $HOME/.ssh/config
