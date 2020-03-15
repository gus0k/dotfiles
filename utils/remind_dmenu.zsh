#!/bin/zsh
source $HOME/.env
vim "$REMIND"$(ls $REMIND | dmenu)
