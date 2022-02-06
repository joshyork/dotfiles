#!/usr/bin/env bash

echo "Starting setup..."
# install xcode CLI
xcode-select --install

# Check for Homebrew to be present, install if it's missing
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "Homebrew already installed 👍"
fi

# Update homebrew recipes
brew update

FORMULAE=(
    antigen
    awscli
    coreutils
    fnm
    jondot/tap/hygen
    jq
    koekeishiya/formulae/skhd
    koekeishiya/formulae/yabai
    rcm
    redis
    starship
    tig
    zsh
)
CASKS=(
    alfred
    1password
    google-chrome
    visual-studio-code
    todoist
    postman
    notion
    kitty
)
echo "Installing Homebrew Formulae..."
brew install ${FORMULAE[@]}

echo "Installing Homebrew Casks..."
brew install --cask ${CASKS[@]}