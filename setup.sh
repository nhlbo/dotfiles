#!/usr/bin/env bash

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

# Copy ZSH file
rm -rf ~/.zshrc
ln .zshrc ~/.zshrc

# Copy fonts
cp -a fonts/SFMono-Nerd-Font-Ligaturized/*.otf ~/Library/Fonts/

# Install tmux
brew install tmux
rm -rf ~/.tmux.conf
cp .tmux.conf $HOME

brew install ripgrep

# Install NvChad
brew install neovim
rm -rf ~/.config/nvim/
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1

# Copy neovim config
rm -rf ~/.config/nvim/lua/custom/
ln -s "$(pwd)/custom" ~/.config/nvim/lua/
