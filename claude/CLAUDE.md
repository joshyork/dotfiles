# Claude Defaults

## Communication

- When presenting options, always include pros/cons for each and a recommendation
- Concise answers — no filler, no restating the question
- When proposing code changes, show the diff or specific edit, not the whole file
- Flag assumptions explicitly so I can correct early

## Shell Commands

- Prefer multiple sequential Bash calls over piped commands

## Autonomy

- Public API surface, DB schema, cross-package boundaries: stop and ask
- Internal implementation within a single file/module: just do it

## Commits

- Do not add `Co-Authored-By` trailers

## Dotfiles

My dotfiles are at `~/code/personal/dotfiles`. You can read/edit files there for:
- Shell config (zshrc, zsh_aliases, zsh_env)
- Tool configs (config/k9s, config/ghostty, etc.)
- Git config (gitconfig, gitconfig-personal, gitconfig-splunk)

Uses rcm - run `rcup` after changes to symlink to home directory.
