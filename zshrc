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
antigen bundle docker
antigen bundle agkozak/zsh-z
# antigen bundle skywind3000/z.lua
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle rjhilgefort/history-search-multi-word

# Tell Antigen that you're done.
antigen apply

# Load broken out config files
[[ -s "$HOME/.zsh_env" ]] && source "$HOME/.zsh_env"
[[ -s "$HOME/.zsh_secrets" ]] && source "$HOME/.zsh_secrets"
[[ -s "$HOME/.zsh_functions" ]] && source "$HOME/.zsh_functions"
[[ -s "$HOME/.zsh_aliases" ]] && source "$HOME/.zsh_aliases"

# starship prompt
eval "$(starship init zsh)"
# fast node manager
eval "$(fnm env --use-on-cd)"
