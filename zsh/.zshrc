# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# editor
export EDITOR="nvim"

# android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# golang
export GOPATH=$HOME/Workspace/go

# nvm settings
export NVM_AUTO_USE=true

# pyenv compat issues
export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"

# completions
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
fpath=($(brew --prefix)/share/zsh/site-functions $fpath)

# settings for history-search-multi-word + Night Owl iTerm theme
zstyle ":history-search-multi-word" highlight-color "fg=yellow,bold"   # Color in which to highlight matched, searched text (default bg=17 on 256-color terminals)

# zgen
source "${HOME}/.zgen/zgen.zsh"
if ! zgen saved; then
  zgen oh-my-zsh
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/gitignore
  zgen oh-my-zsh plugins/docker-compose
  zgen oh-my-zsh plugins/yarn
  zgen load zsh-users/zsh-autosuggestions
  zgen load zdharma/fast-syntax-highlighting
  zgen load zdharma/history-search-multi-word
  zgen load agkozak/zsh-z
  zgen load lukechilds/zsh-nvm
  zgen load mattberther/zsh-pyenv
  zgen load mattberther/zsh-rbenv
  zgen load romkatv/powerlevel10k powerlevel10k
  zgen save
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# common aliases
alias l="exa -1"
alias ll="exa -lh"
alias lt="exa -T -L 1"
alias gclean="git fetch --prune && git git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -d"
