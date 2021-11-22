source /usr/local/bin/antigen.zsh

# Load oh my zsh
antigen use oh-my-zsh
antigen bundle git
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions

antigen bundle mafredri/zsh-async

antigen apply

autoload -U promptinit && promptinit
prompt pure

# other options
#bindkey -v
#bindkey '^R' history-incremental-search-backward

# alias
alias vim="nvim"
alias vi="nvim"
alias ls="exa"
#alias qntfy="cd ~/Code/golang/src/gitlab.qntfy.com"
#alias github="cd ~/Code/golang/src/github.com/Nearhan"
alias golang='cd ~/Code/golang'
#alias slack='open /Applications/Slack.app/ --args --disable-gpu'
alias dv='docker volume rm $(docker volume ls -qf dangling=true)'
alias ds='docker-compose stop && docker-compose rm --force'

# ADD GO PATH
export GOPATH="$HOME/Code/golang"
export PATH="$GOPATH/bin:$PATH"
export GOPRIVATE="github.platforms.engineering"

# Add Python
export PATH"=/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/python@2/libexec/bin:$PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="/usr/local/opt/python@3.8/bin:$PATH"

# Add JAVA
#export JAVA_HOME="/usr/libexec/java_home"


# Add Rust 
export PATH="$HOME/.cargo/bin:$PATH"

# Add NVM
#export NVM_DIR=~/.nvm
#source $(brew --prefix nvm)/nvm.sh

# Editor
export EDITOR='vi'
export GIT_EDITOR=$EDITOR

# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"


# speed up mac os x sierra commands
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false         # For VS Code
#defaults write com.apple.dock expose-animation-duration -float 0.1
#defaults write com.apple.finder DisableAllAnimations -bool true


alias k="kubectl"


# Work Paths
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/farhansyed/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/farhansyed/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/farhansyed/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/farhansyed/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
