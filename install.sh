#!/usr/bin/env bash

# Exit on any error
set -e

# Detect OS
OS="$(uname -s)"
case "${OS}" in
    Linux*)     MACHINE=Linux;;
    Darwin*)    MACHINE=Mac;;
    *)          MACHINE="UNKNOWN:${OS}"
esac

echo "Detected OS: ${MACHINE}"

# Define paths
ZSH_PATH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.oh-my-zsh/custom

# Function to install packages based on OS
install_packages() {
    if [[ "$MACHINE" == "Mac" ]]; then
        # Check if Homebrew is installed
        if ! command -v brew &> /dev/null; then
            echo "Installing Homebrew..."
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        fi
        
        echo "Installing packages with Homebrew..."
        brew install fzf the_silver_searcher bat fd postgresql ripgrep lazygit nmap asdf
        brew install derailed/k9s/k9s
        
    elif [[ "$MACHINE" == "Linux" ]]; then
        # Detect if it's Arch Linux
        if command -v pacman &> /dev/null; then
            echo "Installing packages with pacman..."
            sudo pacman -S --needed fzf the_silver_searcher bat fd postgresql-libs zip unzip xclip ripgrep lazygit nmap asdf-vm k9s
        else
            echo "Error: This script currently only supports Arch Linux for Linux distributions"
            exit 1
        fi
    else
        echo "Unsupported operating system: ${MACHINE}"
        exit 1
    fi
}

# Install Oh My Zsh if not present
if [ ! -d ${ZSH_PATH} ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Run dotfiles installation if Makefile exists
if [ -f "Makefile" ]; then
    echo "Running dotfiles installation..."
    make dotfiles-install
else
    echo "Warning: Makefile not found, skipping dotfiles-install"
fi

# Install zsh plugins
echo "Installing zsh plugins..."
if [ ! -d "${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting
else
    echo "zsh-syntax-highlighting already installed"
fi

if [ ! -d "${ZSH_CUSTOM}/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
else
    echo "zsh-autosuggestions already installed"
fi

# Install system packages
install_packages

# Install asdf plugins
echo "Installing asdf plugins..."
asdf plugin add ruby || echo "Ruby plugin already installed"
asdf plugin add nodejs || echo "Node.js plugin already installed"

# Run asdf installation if Makefile target exists
if [ -f "Makefile" ] && grep -q "asdf-install" Makefile; then
    echo "Running asdf installation..."
    make asdf-install
else
    echo "Warning: asdf-install target not found in Makefile, skipping"
fi

echo "Installation completed successfully!"
echo "Please restart your terminal or run 'source ~/.zshrc' to apply changes."
