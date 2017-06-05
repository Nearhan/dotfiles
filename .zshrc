source /usr/local/src/antigen.zsh


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
export PATH=$PATH:$(go env GOPATH)/bin
export GOPATH=~/Code/golang

alias golang='cd ~/Code/golang'
