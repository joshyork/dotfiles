# Dotfiles

Managed by [rcm](https://github.com/thoughtbot/rcm).

## New Machine Setup

### 1. Xcode CLI Tools

```sh
xcode-select --install
```

### 2. Homebrew

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 3. SSH Key & GitHub

Generate a new key and start the agent:

```sh
ssh-keygen -t ed25519 -C "joshua.s.york@gmail.com"
eval "$(ssh-agent -s)"
```

Create `~/.ssh/config` so the key is automatically loaded and stored in Keychain:

```
Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
```

Add the key to the agent and copy the public key to clipboard:

```sh
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
pbcopy < ~/.ssh/id_ed25519.pub
```

Paste it at [GitHub SSH Keys](https://github.com/settings/keys).

### 4. Clone & Install Dotfiles

```sh
git clone git@github.com:joshyork/dotfiles.git ~/code/personal/dotfiles && cd ~/code/personal/dotfiles
```

Install everything (formulae, casks, fonts):

```sh
brew bundle
```

Symlink dotfiles:

```sh
rcup -d ~/code/personal/dotfiles
```

### 5. macOS Defaults

```sh
~/bin/macos-defaults
```

This disables Ctrl+Arrow Mission Control shortcuts, sets fast key repeat, shows hidden files in Finder, auto-hides the dock, and more. Log out/in after running.

### 6. Raycast

- Open Raycast, set trigger to `Cmd+Space` (Spotlight shortcut already disabled by `macos-defaults`)
- [Install Raycast Bookmarks](https://github.com/joshyork/raycast-bookmarks)

### 7. Shell

Open a new Ghostty window — starship, atuin, and all shell config should load automatically from the symlinked dotfiles.

```sh
atuin login
```

### 8. Cursor / VS Code (after Dropbox sync)

```sh
symlink-cursor-settings
```

### 9. Neovim

Open `nvim` — lazy.nvim will auto-install all plugins on first launch. Mason will install LSP servers and formatters.

For TypeScript projects, install TypeScript globally so the LSP works everywhere:

```sh
npm install -g typescript
```
