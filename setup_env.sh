#!/usr/bin/env bash

# run from the home folder
cd ~

cp .env_config/.vimrc .
cp -r .env_config/.config .
cp .env_config/.gitconfig .
case "$OSTYPE" in
  darwin*)  cp .env_config/.tmux.conf_OSX .tmux.conf ;; 
  linux*)   cp .env_config/.tmux.conf_linux .tmux.conf ;;
  *)        echo "unknown: $OSTYPE" ;;
esac
