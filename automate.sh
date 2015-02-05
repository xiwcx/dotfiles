#!/bin/bash

npm install --global yo bower grunt-cli http-server
curl -L http://install.ohmyz.sh | sh
ln -s /usr/local/lib/node_modules/pure-prompt/pure.zsh ~/.oh-my-zsh/custom/pure.zsh-theme
ln -s code/dotfiles/.vimrc ~/.vimrc
ln -s code/dotfiles/.zshrc ~/.zshrc
