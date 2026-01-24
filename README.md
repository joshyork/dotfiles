# Dotfiles

dotfiles managed by [rcm](https://github.com/thoughtbot/rcm)

## New Machine Setup

- [ ] Install xcode cli tools

  ```sh
  xcode-select --install
  ```

- [ ] [Install Dropbox](https://www.dropbox.com/install)

- [ ] [Install Arc](https://arc.net/)

- [ ] [Download 1Password](https://1password.com/downloads/mac)

- [ ] [Download Raycast](https://www.raycast.com/)
  - [ ] Disable Spotlight keyboard shortcuts: `System Preferences > Keyboard > Keyboard Shortcuts > Spotlight > uncheck all`
        Keyboard > Keyboard Shortcuts > Spotlight > uncheck all`

  - [ ] Update Raycast trigger to cmd+space

- [ ] `Settings > Dock & Desktop > check 'Automatically hide and show the Dock'`
- [ ] `System Preferences > Dock & Desktop > Default web browser > Arc`
- [ ] `System Preferences > Dock & Desktop > Uncheck 'Automatically rearrange Spaces'`
- [ ] `System Preferences > Trackpad > Uncheck 'Scroll Direction: Natural'`
- [ ] `System Preferences > Keyboard > Modifier Keys > Map Caps lock -> Escape`
- [ ] Allow press and hold in Cursor

  ```sh
  # Cursor
  defaults write "$(osascript -e 'id of app "Cursor"')" ApplePressAndHoldEnabled -bool false && osascript -e 'quit app "Cursor"

  # VSCode
  defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
  ```

- [ ] [Install Ghostty](https://ghostty.org/download)

- [ ] [Install Cursor](https://cursor.com/download)
- [ ] Generate SSH key & Add to Github

  <https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent>
  - [ ] Generate key

    ```sh
    ssh-keygen -t ed25519 -C "joshua.s.york@gmail.com"
    ```

  - [ ] Start the ssh-agent in the background.

    ```sh
    eval "$(ssh-agent -s)"
    ```

  - [ ] Check if ssh config exists

    ```sh
    open ~/.ssh/config
    ```

    - create it if it doesn't

      ```sh
      touch ~/.ssh/config
      ```

  - [ ] update ssh config contents

    ```txt
    Host *
    AddKeysToAgent yes
    UseKeychain yes
    IdentityFile ~/.ssh/id_ed25519
    ```

    ```sh
    vim ~/.ssh/config
    ```

- [ ] Add private key to ssh-agent
  - `ssh-add --apple-use-keychain ~/.ssh/id_ed25519`
- [ ] [Add pub key to Github](https://github.com/settings/keys)

  ```sh
  pbcopy < ~/.ssh/id_ed25519.pub
  ```

- `mkdir -p ~/code/personal && cd ~/code/personal`
- [ ] clone this repo, cd to it, double check `DOTFILES_DIRS` env var value in `rcrc`
- [ ] [Install Homebrew](https://brew.sh/)
- [ ] Install Homebrew Formulae

  ```sh
  brew install $(cat brew.txt)
  ```

- [ ] `rcup -d $HOME/code/personal/dotfiles`
- [ ] [Install Yabai](<https://github.com/asmvik/yabai/wiki/Installing-yabai-(latest-release)>)
- Symlink Cursor files (once dropbox has finished syncing)

  ```sh
  . ~/code/personal/dotfiles/symlink-cursor-settings.sh
  ```

- [ ] `atuin login`
- [ ] [Install Raycast Bookmarks](https://github.com/joshyork/raycast-bookmarks)
