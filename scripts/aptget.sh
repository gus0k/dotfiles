sudo apt-add-repository non-free
sudo apt-get update

sudo apt-get install -y \
    python3 \
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
    python3-pip \
    htop \
    pandoc \
    pandoc-citeproc \
    screen \
    firmware-misc-nonfree \
    tmux \
    rsync \
    mutt \
    weechat \
    weechat-python \
    python3-websocket \
    parallel \
    bc \
    network-manager-openvpn-gnome \
    openvpn \
    ranger \
    cmake \
    rxvt-unicode \
    xsel \
    net-tools \
    gnupg-agent \
    pinentry-curses \
    autoconf \
    remind \
    git \
    gcc \
    make \
    xcb \
    libxcb-util0-dev \
    libxcb-ewmh-dev \
    libxcb-randr0-dev \
    libxcb-icccm4-dev \
    libxcb-keysyms1-dev \
    libxcb-xinerama0-dev \
    libxcb-ewmh2

sudo python3 -m pip install virtualenv 
python3 -m pip install --user pipx

pipx install papis
pipx install cowsay
pipx install https://github.com/plainas/tq/zipball/stable


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

# Spotify
curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install -y spotify-client


## Install syncthing
curl -s https://syncthing.net/release-key.txt | sudo apt-key add -

# Add the "stable" channel to your APT sources:
echo "deb https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list

# Update and install syncthing:
sudo apt-get update
sudo apt-get install syncthing
