#!/bin/bash

DOTFILES="$HOME/dotfiles"

# Check if stow is installed
if ! command -v stow &> /dev/null; then
    echo "stow is not installed. Please install it: yay -S stow"
    exit 1
fi

# Array of directories to stow
dirs=("zsh" "vim" "nvim" "tmux" "ghostty")

# Stow each directory
for dir in "${dirs[@]}"; do
    echo "Stowing $dir"
    mkdir -p "$HOME/.config"
    stow -v -t "$HOME/.config" -d "$DOTFILES" "$dir"
else
    echo "$dir doesn't exist in $DOTFILES, skipping"
fi

echo "All configs are stowed into $HOME/.config."
