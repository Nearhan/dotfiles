#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "Starting installation of Homebrew and Oh My Posh..."

# Check if Homebrew is already installed
if command -v brew &>/dev/null; then
    echo "Homebrew is already installed. Updating..."
    brew update
else
    echo "Installing Homebrew..."
    # The official Homebrew installation command
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Set up Homebrew in the current shell session
    if [[ $(uname) == "Darwin" ]]; then
        # macOS
        echo "Setting up Homebrew paths for macOS..."
        # These might be needed depending on the system architecture (Intel vs Apple Silicon)
        if [[ $(uname -m) == "arm64" ]]; then
            echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
            eval "$(/opt/homebrew/bin/brew shellenv)"
        else
            echo 'eval "$(/usr/local/bin/brew shellenv)"' >> ~/.zprofile
            eval "$(/usr/local/bin/brew shellenv)"
        fi
    elif [[ $(uname) == "Linux" ]]; then
        # Linux
        echo "Setting up Homebrew paths for Linux..."
        echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.profile
        eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    fi
fi

# Install Alacritty
echo "==========="
echo "install Alacritty"
brew install alacritty || true
cp .alacritty.toml ~/

# Move .zshrc to correct location
echo "==========="
echo "Moving .zshrc"
cp .zshrc ~/

# Install Oh My Posh
echo "Installing Oh My Posh..."
brew tap jandedobbeleer/oh-my-posh
brew install oh-my-posh

echo "Installation complete!"
echo "To use Oh My Posh, you need to configure your shell to use it."
echo "Check the documentation at: https://ohmyposh.dev/docs/installation/prompt"
