source /usr/local/bin/antigen.zsh

# alias
alias vim="nvim"
alias vi="nvim"
alias qntfy="cd ~/Code/golang/src/gitlab.qntfy.com"
alias github="cd ~/Code/golang/src/github.com/Nearhan"
alias golang='cd ~/Code/golang'
alias slack='open /Applications/Slack.app/ --args --disable-gpu'


# Load oh my zsh
antigen use oh-my-zsh
antigen bundle git
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting

antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure

antigen apply


# ADD GO PATH
export GOPATH="$HOME/Code/golang"
export PATH="$GOPATH/bin:$PATH"

# Add Python
export PATH"=/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/python@2/libexec/bin:$PATH"

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
defaults write com.apple.dock expose-animation-duration -float 0.1
defaults write com.apple.finder DisableAllAnimations -bool true
