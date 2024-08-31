#!/bin/bash

DOTFILES="$HOME/dotfiles"

# Check if stow is installed
if ! command -v stow &> /dev/null; then
    echo "stow is not installed. Please install it : yay -S stow"
    exit 1
fi

# Array of directories to stow
dirs=("zsh" "vim" "tmux")

# Stow each directory
for dir in "${dirs[@]}"; do
    echo "Stow-ing $dir"
    stow -v -t "$HOME" -d "$DOTFILES" "$dir"
done

echo "Good as old! All Configs are install."
