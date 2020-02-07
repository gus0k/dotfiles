sudo apt-get update

sudo apt-get install -y \
	curl \
	keychain \
	zsh \
	ack-grep \
        vim-gnome \
       


# Install oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
   git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
else
    echo "Oh - my - zsh already exists"
fi

# Install fzf
if [ ! -d "$HOME/.fzf" ]; then
   git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
   zsh "$HOME/.fzf/install"
else
    echo "fzf already exists"
fi


