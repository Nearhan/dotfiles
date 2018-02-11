source /usr/local/src/antigen.zsh

# alias
alias vim="nvim"
alias vi="nvim"
alias qntfy="cd ~/Code/golang/src/gitlab.qntfy.com"
alias github="cd ~/Code/golang/src/github.com/Nearhan"
alias golang='cd ~/Code/golang'


# Load oh my zsh
antigen use oh-my-zsh
antigen bundle git
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting

antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure

antigen apply


# Paths
export PATH=$PATH:/usr/local/go/bin

# ADD GO PATH
export GOPATH=~/Code/golang
export PATH=$PATH:$(go env GOPATH)/bin

# Add Python
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Editor
export EDITOR='vi'
export GIT_EDITOR=$EDITOR

# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
