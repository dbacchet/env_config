#!/usr/bin/env bash

# run from the home folder
cd ~

cp .env_config/.vimrc .
cp -r .env_config/.config .
cp .env_config/.gitconfig .
cp .env_config/.alacritty.yml .
case "$OSTYPE" in
  darwin*)  cp .env_config/.tmux.conf_OSX .tmux.conf ;; 
  linux*)   cp .env_config/.tmux.conf_linux .tmux.conf ;;
  *)        echo "unknown: $OSTYPE" ;;
esac
# install oh-my-zsh
rm -rf ~/.oh-my-zsh
git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
# custom zsh theme and config file
cp .env_config/zsh/themes/dbacchet.zsh-theme ~/.oh-my-zsh/themes
cp .env_config/.zshrc .
