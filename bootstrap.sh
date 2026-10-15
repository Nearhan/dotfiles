#!/bin/bash
# Usage:
#   ./bootstrap.sh        install Homebrew + Brewfile, then symlink dotfiles into $HOME
#   ./bootstrap.sh link   only (re)create the symlinks

# Exit immediately if a command exits with a non-zero status
set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

# Symlink $DOTFILES/$1 to $2, moving any existing real file/dir aside first
link() {
    local src="$DOTFILES/$1" dest="$2"
    if [[ -L "$dest" ]]; then
        rm "$dest"
    elif [[ -e "$dest" ]]; then
        local backup="$dest.backup.$(date +%Y%m%d%H%M%S)"
        mv "$dest" "$backup"
        echo "backed up $dest -> $backup"
    fi
    mkdir -p "$(dirname "$dest")"
    ln -s "$src" "$dest"
    echo "linked $dest -> $src"
}

link_all() {
    link .zshrc     "$HOME/.zshrc"
    link .zprofile  "$HOME/.zprofile"
    link .tmux.conf "$HOME/.tmux.conf"
    link nvim       "$HOME/.config/nvim"
    link kitty      "$HOME/.config/kitty"

    # Secrets go in ~/.zshrc.local, which is never committed
    touch "$HOME/.zshrc.local"
    chmod 600 "$HOME/.zshrc.local"
}

if [[ "$1" == "link" ]]; then
    link_all
    exit 0
fi

if command -v brew &>/dev/null; then
    echo "Homebrew is already installed. Updating..."
    brew update
else
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "==========="
echo "Installing Brewfile"
brew bundle --file "$DOTFILES/Brewfile"

echo "==========="
echo "Linking dotfiles"
link_all

# Allow key repeat (instead of the accent popup) in VS Code, for vim mode
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

echo "Done. Put API keys/tokens in ~/.zshrc.local, then open a new kitty window."
