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
    awscli
    coreutils
    direnv
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
    atuin
)
echo "START: Homebrew formulae"
brew install ${FORMULAE[@]}
echo -e "END: Homebrew formulae\n"

CASKS=(
    iterm2,"Iterm 2"
    1password,"1Password 7"
    google-chrome,"Google Chrome"
    visual-studio-code,"Visual Studio Code"
    todoist,"Todoist"
    postman,"Postman"
    notion,"Notion"
    keycastr,"KeyCastr"
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
