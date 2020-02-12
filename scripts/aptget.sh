sudo apt-get update

sudo apt-get install -y \
	curl \
	keychain \
	zsh \
	ack-grep \
        vim-gtk \
        wget \
	apt-transport-https \
	ca-certificates \
	gnupg2 \
	software-properties-common \
	zathura \
	xdotool \

# Docker key        
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

## Add repo (amd64)
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt -y install docker-ce docker-ce-cli containerd.io

sudo usermod -aG docker $USER
newgrp docker

sudo service docker start


# Install oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
   git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
else
    echo "Oh - my - zsh already exists"
fi

# Install fzf
if [ ! -d "$HOME/.fzf" ]; then
   git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
   sh "$HOME/.fzf/install"
else
    echo "fzf already exists"
fi



