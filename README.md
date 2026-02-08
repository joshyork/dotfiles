# Dotfiles

Managed by [rcm](https://github.com/thoughtbot/rcm).

## New Machine Setup

### 1. Xcode CLI Tools

```sh
xcode-select --install
```

### 2. Core Apps (manual installs)

Install these first — they don't depend on anything else:

- [1Password](https://1password.com/downloads/mac)
- [Arc](https://arc.net/)
- [Ghostty](https://ghostty.org/download)
- [Raycast](https://www.raycast.com/)
- [Dropbox](https://www.dropbox.com/install)
- [Cursor](https://cursor.com/download)

Set Arc as default browser: `System Settings > Desktop & Dock > Default web browser > Arc`

### 3. Raycast

- Disable Spotlight: `System Settings > Keyboard > Keyboard Shortcuts > Spotlight > uncheck all`
- Open Raycast, set trigger to `Cmd+Space`
- [Install Raycast Bookmarks](https://github.com/joshyork/raycast-bookmarks)

### 4. Homebrew

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 5. SSH Key & GitHub

```sh
ssh-keygen -t ed25519 -C "joshua.s.york@gmail.com"
eval "$(ssh-agent -s)"
```

Create/update `~/.ssh/config`:

```
Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
```

```sh
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
pbcopy < ~/.ssh/id_ed25519.pub
```

[Add pub key to GitHub](https://github.com/settings/keys)

### 6. Clone & Install Dotfiles

```sh
mkdir -p ~/code/personal && cd ~/code/personal
git clone git@github.com:joshyork/dotfiles.git
cd dotfiles
```

Install everything (formulae, casks, fonts):

```sh
brew bundle
```

Symlink dotfiles:

```sh
rcup -d ~/code/personal/dotfiles
```

### 7. macOS Defaults

```sh
macos-defaults
```

This disables Ctrl+Arrow Mission Control shortcuts, sets fast key repeat, shows hidden files in Finder, auto-hides the dock, and more. Log out/in after running.

### 8. Remaining Manual Settings

- `System Settings > Trackpad > Uncheck 'Scroll Direction: Natural'`
- `System Settings > Desktop & Dock > Uncheck 'Automatically rearrange Spaces'`
- `System Settings > Menu Bar > Clock Options > Display the time with seconds`

### 9. Shell

Open a new Ghostty window — starship, atuin, and all shell config should load automatically from the symlinked dotfiles.

```sh
atuin login
```

### 10. Yabai

[Install Yabai](https://github.com/koekeishiya/yabai/wiki/Installing-yabai-(latest-release))

### 11. Cursor / VS Code (after Dropbox sync)

```sh
. ~/code/personal/dotfiles/symlink-cursor-settings.sh
```

### 12. Neovim

Open `nvim` — lazy.nvim will auto-install all plugins on first launch. Mason will install LSP servers and formatters.

For TypeScript projects, install TypeScript globally so the LSP works everywhere:

```sh
npm install -g typescript
```

## What's Included

| Config | Location | Notes |
|--------|----------|-------|
| Zsh | `zshrc`, `zsh_aliases`, `zsh_env` | Antigen, starship prompt, atuin history |
| Neovim | `config/nvim/` | Kickstart-based, lazy.nvim, LSP, treesitter |
| Tmux | `config/tmux/` | `C-a` prefix, vim-style nav, session switcher |
| Ghostty | `config/ghostty/` | Monaspace font, theme |
| Karabiner | `config/karabiner/` | Caps Lock → Ctrl (hold) / Escape (tap) |
| Git | `gitconfig`, `gitconfig-personal`, `gitconfig-splunk` | Conditional includes by directory |
| Yabai | `yabairc` | Tiling window manager |
| skhd | `skhdrc` | Yabai keyboard shortcuts |
| k9s | `config/k9s/` | Kubernetes TUI |

## Scripts (`~/bin`)

| Script | Usage |
|--------|-------|
| `dev [path]` | Opens a tmux session with claude/edit/shell/server/misc windows |
| `macos-defaults` | Applies macOS system defaults for new machines |
| `spur-tabs` | Opens browser tabs for spur dev workflow |
