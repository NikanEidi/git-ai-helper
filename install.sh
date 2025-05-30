#!/bin/bash

set -e

REPO_URL="https://github.com/YOUR_USERNAME/git-ai-helper"
INSTALL_DIR="$HOME/.git-ai-helper"
ALIAS_NAME="git-ai"
SHELL_PROFILE=""

# Detect shell profile
if [ -n "$ZSH_VERSION" ]; then
    SHELL_PROFILE="$HOME/.zshrc"
elif [ -n "$BASH_VERSION" ]; then
    SHELL_PROFILE="$HOME/.bashrc"
else
    echo "️ Unsupported shell. Please manually add the alias to your shell profile."
fi

# Clone or pull latest repo
if [ -d "$INSTALL_DIR" ]; then
    echo " Updating existing Git AI Helper..."
    cd "$INSTALL_DIR" && git pull origin main
else
    echo " Cloning Git AI Helper..."
    git clone "$REPO_URL" "$INSTALL_DIR"
fi

# Ensure dependencies are installed
echo " Checking and installing Python dependencies..."
pip3 install --user -r "$INSTALL_DIR/requirements.txt"

# Create alias
if ! grep -q "$ALIAS_NAME" "$SHELL_PROFILE"; then
    echo " Adding alias to $SHELL_PROFILE..."
    echo "alias $ALIAS_NAME='python3 $INSTALL_DIR/main.py'" >> "$SHELL_PROFILE"
    source "$SHELL_PROFILE"
fi

# Final message
echo "\n Git AI Helper installed successfully! Type '[bold green]$ALIAS_NAME[/bold green]' in your terminal to start using it."
echo "If this doesn’t work right away, try opening a new terminal window."

