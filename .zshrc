# Load oh my zsh
source "${HOMEBREW_PREFIX:-/opt/homebrew}/share/antigen/antigen.zsh"
antigen use oh-my-zsh
antigen bundle git
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen apply

# antigen defers compinit until the first prompt, which would wipe completions
# registered below (gcloud). Run it once now and cancel the deferred one.
autoload -Uz compinit && compinit
add-zsh-hook -D precmd _antigen_compinit

# Prompt: pure (brew puts it on fpath via `brew shellenv` in .zprofile)
autoload -U promptinit && promptinit
prompt pure

# alias
alias vim="nvim"
alias vi="nvim"
alias ls="exa"
alias k="kubectl"
alias golang='cd ~/Code/golang'
alias dv='docker volume rm $(docker volume ls -qf dangling=true)'
alias ds='docker-compose stop && docker-compose rm --force'

# Editor
export EDITOR='nvim'
export GIT_EDITOR=$EDITOR

# Go
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
export GOPRIVATE="gitlab.bouncex.net"
export GOAUTH="gar goauth"
alias go='NETRC="$(gar go)" go'

# Node
export NVM_DIR="$HOME/.nvm"
source "${HOMEBREW_PREFIX:-/opt/homebrew}/opt/nvm/nvm.sh"
alias npm='NPM_CONFIG_USERCONFIG="$(gar npm)" npm'

# Python
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Other tools
export PATH="${HOMEBREW_PREFIX:-/opt/homebrew}/opt/mysql-client/bin:$PATH"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="$PATH:$HOME/.lmstudio/bin"

# gcloud completion (gcloud itself is on PATH via the brew cask)
GCLOUD_COMPLETION="${HOMEBREW_PREFIX:-/opt/homebrew}/share/google-cloud-sdk/completion.zsh.inc"
[[ -f $GCLOUD_COMPLETION ]] && source "$GCLOUD_COMPLETION"
unset GCLOUD_COMPLETION

# refresh token
refresh-gar-netrc() {
  printf "machine us-central1-go.pkg.dev\nlogin oauth2accesstoken\npassword %s\n" "$(gcloud auth print-access-token)" > ~/.netrc
  chmod 600 ~/.netrc
  echo "~/.netrc refreshed"
}

export PATH="$HOME/.local/bin:$PATH"

# Secrets and machine-specific settings live here (never committed)
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
