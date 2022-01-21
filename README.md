# Dotfiles

Managed by [rcm](https://github.com/thoughtbot/rcm)

Starship shell prompt preview:

![Josh York Starship shell prompt](shell_prompt.png)

## Steps for setting up a new machine

### Install

- change trackpad direction
- [ ] Swap caps lock for ESC in system preferences
- [ ] System Prefs > Mission Control > Uncheck Automatically rearrange Spaces
- [ ] Password Manager (and chrome extension)
- [ ] [Alfred](https://www.alfredapp.com/)
- https://www.alfredapp.com/help/troubleshooting/cmd-space/
- chrome
- set default browser
- [ ] `defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false`
- [ ] [VSCode](https://code.visualstudio.com/download)
- [ ] [iTerm](https://iterm2.com/version3.html)
- [ ] [homebrew](https://docs.brew.sh/Installation)
- brew install starship
- [ ] `rcup -x shell_prompt.png -x iterm_profile.json` - use `rcm` to symlink dotfiles to their correct locations
- [ ] [rcm](https://github.com/thoughtbot/rcm)
- [ ] [nerd font](https://www.nerdfonts.com/font-downloads)
- [ ] [fira code](https://github.com/tonsky/FiraCode)
- [ ] [yabai](https://github.com/koekeishiya/yabai#installation-and-configuration)
- [ ] [jq](https://formulae.brew.sh/formula/jq) (used by yabai for json parsing)
- [ ] [notion](https://www.notion.so/desktop)
- [ ] [tig](https://formulae.brew.sh/formula/tig)

### Additional Steps

- [ ] Import iTerm profile (from `~/.dotfiles` folder)

- [ ] `mkdir ~/code`
  - [ ] and subfolders like `personal` and "`company`". This needs to be coordinated with
        the `includeIf` paths in `gitconfig`
