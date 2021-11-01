ZSH_DISABLE_COMPFIX=true

export PATH=$HOME/bin:/usr/local/bin:$PATH:$HOME/Library/Python/3.9/bin:$HOME/.local/bin:$HOME/.ghcup/bin:/opt/homebrew/bin

export ZSH="$HOME/.oh-my-zsh"

# THEME
# theme / prompt is handled by starship
# ZSH_THEME=""

# PLUGINS
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

[[ -s "$HOME/.zsh_secrets" ]] && source "$HOME/.zsh_secrets"
[[ -s "$HOME/.zsh_functions" ]] && source "$HOME/.zsh_functions"
[[ -s "$HOME/.zsh_aliases" ]] && source "$HOME/.zsh_aliases"

# z directory jumping utility
source $ZSH_CUSTOM/plugins/zsh-z/zsh-z.plugin.zsh
zstyle ':completion:*' menu select

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  elif [[ $(nvm version) != $(nvm version default)  ]]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# YVM
export YVM_DIR=$HOME/.yvm
[ -r $YVM_DIR/yvm.sh ] && . $YVM_DIR/yvm.sh
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

# starship prompt
eval "$(starship init zsh)"
