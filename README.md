# Dotfiles

Managed by [rcm](https://github.com/thoughtbot/rcm)

Starship shell prompt preview:

![Josh York Starship shell prompt](shell_prompt.png)

## Steps for setting up a new machine

- Change trackpad direction

  `Settings > Trackpad > Uncheck 'Scroll Direction: Natural'`

- Swap caps lock for ESC in system preferences

  `Settings > Keyboard > Modifier Keys`

- Disable automatic sorting of macOS spaces

  `Settings > Mission Control > Uncheck 'Automatically rearrange Spaces'`

- Allow Alfred to use `cmd+space`
  https://www.alfredapp.com/help/troubleshooting/cmd-space/

- Generate ssh key and add to github

  https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

  - `ssh-keygen -t ed25519 -C "joshua.s.york@gmail.com"`
  - `eval "$(ssh-agent -s)"`
  - `open ~/.ssh/config`
  - `touch ~/.ssh/config`
  - `vim ~/.ssh/config`
    ```
    Host *
    AddKeysToAgent yes
    UseKeychain yes
    IdentityFile ~/.ssh/id_ed25519
    ```
  - `ssh-add --apple-use-keychain ~/.ssh/id_ed25519`

- clone this repo, update `rcrc` with `DOTFILES_DIRS`
- `rcup`
- `./macos-setup.sh`
- Set default browser

  `Settings > General`

- Allow press and hold for VSCode

  `defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false`

- Download and install Fira Code Nerd Font

  https://www.nerdfonts.com/font-downloads
