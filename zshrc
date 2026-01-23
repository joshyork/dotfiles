[[ -s "$HOME/.zsh_env" ]] && source "$HOME/.zsh_env"

# Load Antigen
source $(brew --prefix)/share/antigen/antigen.zsh

### Load the oh-my-zsh's library.
antigen use oh-my-zsh

### Bundles
antigen bundle git
antigen bundle command-not-found
antigen bundle common-aliases
antigen bundle compleat
antigen bundle npm
antigen bundle vi-mode
antigen bundle git-extras
antigen bundle agkozak/zsh-z
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle atuinsh/atuin@main

# Tell Antigen that you're done.
antigen apply

# Load broken out config files
[[ -s "$HOME/.zsh_secrets" ]] && source "$HOME/.zsh_secrets"
[[ -s "$HOME/.zsh_functions" ]] && source "$HOME/.zsh_functions"
[[ -s "$HOME/.zsh_aliases" ]] && source "$HOME/.zsh_aliases"

# https://github.com/starship/starship/issues/3418#issuecomment-2477375663
if [[ "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select" || \
      "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select-wrapped" ]]; then
    zle -N zle-keymap-select "";
fi
eval "$(starship init zsh)"

# fast node manager
eval "$(fnm env --use-on-cd)"

# direnv
eval "$(direnv hook zsh)"

eval "$(atuin init zsh)"
