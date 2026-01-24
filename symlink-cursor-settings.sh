#!/usr/bin/env bash
rm -rf ~/.cursor
rm -rf ~/Library/Application\ Support/Cursor
mkdir ~/.cursor
mkdir ~/Library/Application\ Support/Cursor
mkdir ~/Library/Application\ Support/Cursor/User
ln -sf ~/Dropbox/development/CursorSync/extensions ~/.cursor/extensions
ln -sf ~/Dropbox/development/CursorSync/User/keybindings.json ~/Library/Application\ Support/Cursor/User/keybindings.json
ln -sf ~/Dropbox/development/CursorSync/User/settings.json ~/Library/Application\ Support/Cursor/User/settings.json
ln -sf ~/Dropbox/development/CursorSync/User/snippets ~/Library/Application\ Support/Cursor/User/snippets