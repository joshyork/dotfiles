#!/usr/bin/env bash

echo "START: XCode cli tools"
# install xcode CLI
xcode-select --install
echo -e "END: XCode cli tools\n"

echo "START: Homebrew"
# Check for Homebrew to be present, install if it's missing
if test ! $(which brew); then
    echo "Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'PATH="/usr/local/bin:$PATH"' >> ~/.bash_profile
    source ~/.bash_profile
    echo "Homebrew successfully installed"
else
    echo "Homebrew already installed 👍"
fi
echo -e "END: Homebrew\n"

# Update homebrew recipes
brew update

FORMULAE=(
    antigen
    atuin
    awscli
    coreutils
    direnv
    fnm
    jq
    koekeishiya/formulae/skhd
    koekeishiya/formulae/yabai
    rcm
    starship
    tig
    zsh
)
echo "START: Homebrew formulae"
brew install ${FORMULAE[@]}
echo -e "END: Homebrew formulae\n"

CASKS=(
    alacritty,"Alacritty"
    google-chrome,"Google Chrome"
    notion,"Notion"
    raycast,"Raycast"
    discord,"Discord"
    ngrok,"Ngrok"
)
echo "START: Homebrew casks"
(
IFS=$'\n'
for TUPLE in ${CASKS[@]}; do
    IFS=',';
    set -- $TUPLE
    if [[ ! -d "/Applications/$2.app" ]]; then
        echo "Installing $1 at $2"
        brew install --cask $1
    else
        echo "$2 already installed. Skipping $1 cask."
    fi
done
)
echo "END: Homebrew casks"
