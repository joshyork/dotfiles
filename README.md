# Dotfiles

Managed by [rcm](https://github.com/thoughtbot/rcm)

Starship shell prompt preview:

![Josh York Starship shell prompt](shell_prompt.png)

## Steps for setting up a new machine

### Install

- [iTerm](https://iterm2.com/version3.html)
- [homebrew](https://docs.brew.sh/Installation)
- [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh#basic-installation)
- [starship prompt](https://starship.rs/guide/#%F0%9F%9A%80-installation)
- [rcm](https://github.com/thoughtbot/rcm)
- [yabai](https://github.com/koekeishiya/yabai#installation-and-configuration)

### Run / Additional Steps

- `rcup` - use `rcm` to symlink dotfiles to their correct locations
- `mkdir ~/code`
  - and subfolders like `personal` and "`company`". This needs to be coordinated with
    the `includeIf` paths in `gitconfig`
