# Dotfiles

Managed by [rcm](https://github.com/thoughtbot/rcm)

Starship shell prompt preview:

![Josh York Starship shell prompt](shell_prompt.png)

## Steps for setting up a new machine

### Install

- [ ] [Alfred](https://www.alfredapp.com/)
- [ ] Password Manager (and chrome extension)
- [ ] [VSCode](https://code.visualstudio.com/download)
- [ ] [iTerm](https://iterm2.com/version3.html)
- [ ] [homebrew](https://docs.brew.sh/Installation)
- [ ] [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh#basic-installation)
- [ ] [starship prompt](https://starship.rs/guide/#%F0%9F%9A%80-installation)
- [ ] [nerd font](https://www.nerdfonts.com/font-downloads)
- [ ] [fira code](https://github.com/tonsky/FiraCode)
- [ ] [rcm](https://github.com/thoughtbot/rcm)
- [ ] [yabai](https://github.com/koekeishiya/yabai#installation-and-configuration)
- [ ] [jq](https://formulae.brew.sh/formula/jq) (used by yabai for json parsing)
- [ ] [z jumping](https://github.com/agkozak/zsh-z#for-oh-my-zsh-users)
- [ ] [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md)
- [ ] [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md)
- [ ] [nvm](https://github.com/nvm-sh/nvm#installing-and-updating)
- [ ] [notion](https://www.notion.so/desktop)
- [ ] [tig](https://formulae.brew.sh/formula/tig)

### Additional Steps

- [ ] System Prefs > Mission Control > Uncheck Automatically rearrange Spaces
- [ ] Swap caps lock for ESC in system preferences
- [ ] Import iTerm profile (from `~/.dotfiles` folder)
- [ ] `defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false`
- [ ] `rcup -x shell_prompt.png -x iterm_profile.json` - use `rcm` to symlink dotfiles to their correct locations
- [ ] `mkdir ~/code`
  - [ ] and subfolders like `personal` and "`company`". This needs to be coordinated with
        the `includeIf` paths in `gitconfig`
