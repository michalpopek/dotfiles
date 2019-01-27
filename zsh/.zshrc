# Env vars
export EDITOR="vim"
export BAT_THEME="1337"
export NVM_DIR="$HOME/.nvm"

# Antigen
source /usr/local/share/antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure
antigen apply

# NVM
source "/usr/local/opt/nvm/nvm.sh"

# Aliases
alias ls="exa -lh"
alias cat="bat"
