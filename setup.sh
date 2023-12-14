#!/usr/bin/env bash

# Show hidden files
defaults write com.apple.Finder AppleShowAllFiles true

# Turn off gatekeeper
sudo spctl --master-disable

# Set up ssh
if [ ! -d "${HOME}/.ssh" ]; then
    mkdir -p "${HOME}/.ssh"
    ssh-keygen -t rsa -f "${HOME}/.ssh/id_rsa"
fi

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/nhlbo/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Config git profile
git config --global user.email "nhlbo@users.noreply.github.com"
git config --global user.name "Hoang Long Nguyen"

# Install oh-my-zsh and plugins
rm -rf ${ZSH}
ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" <<< "exit"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
git clone https://github.com/jeffreytse/zsh-vi-mode ${ZSH_CUSTOM}/plugins/zsh-vi-mode
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM}/themes/powerlevel10k

# Copy ZSH file
rm -rf ~/.zshrc
ln .zshrc ~/.zshrc
rm -rf ~/.p10k.zsh
ln .p10k.zsh ~/.p10k.zsh

# Copy fonts
brew tap shaunsingh/SFMono-Nerd-Font-Ligaturized
brew install --cask font-sf-mono-nerd-font-ligaturized

# Install tmux
brew install tmux
rm -rf ~/.tmux.conf
cp .tmux.conf $HOME

# Install NvChad
brew install neovim
rm -rf ~/.config/nvim/
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1

# Copy .config
rm -rf ~/.config/nvim/lua/custom/
ln -s "$(pwd)/.config/nvim/lua/custom" ~/.config/nvim/lua/
rm -rf ~/.config/kitty
ln -s "$(pwd)/.config/kitty" ~/.config/

# Install dev environments
brew install node
brew install ripgrep
brew install gcc
