#!/bin/bash

set -e

REPO_URL="https://github.com/NikanEidi/git-ai-helper.git"
INSTALL_DIR="$HOME/.git-ai-helper"
VENV_DIR="$INSTALL_DIR/venv"
ALIAS_NAME="git-ai"

# Detect shell profile
if [ -n "$ZSH_VERSION" ]; then
    SHELL_PROFILE="$HOME/.zshrc"
elif [ -n "$BASH_VERSION" ]; then
    SHELL_PROFILE="$HOME/.bashrc"
elif [ -f "$HOME/.zshrc" ]; then
    SHELL_PROFILE="$HOME/.zshrc"
elif [ -f "$HOME/.bashrc" ]; then
    SHELL_PROFILE="$HOME/.bashrc"
else
    echo "Unsupported shell. Please add the alias manually."
    exit 1
fi

# Clone or update the repository
if [ -d "$INSTALL_DIR" ]; then
    echo "Updating Git AI Helper..."
    cd "$INSTALL_DIR" && git pull origin main
else
    echo "Cloning Git AI Helper..."
    git clone "$REPO_URL" "$INSTALL_DIR"
fi

# Set up virtual environment
if [ ! -d "$VENV_DIR" ]; then
    echo "Creating Python virtual environment..."
    python3 -m venv "$VENV_DIR"
fi

echo "Installing dependencies inside virtual environment..."
source "$VENV_DIR/bin/activate"
pip install --upgrade pip
pip install -r "$INSTALL_DIR/requirements.txt"
deactivate

# Add alias to shell profile if missing
if ! grep -q "$ALIAS_NAME" "$SHELL_PROFILE"; then
    echo "Adding alias to $SHELL_PROFILE..."
    echo "alias $ALIAS_NAME='source $VENV_DIR/bin/activate && python3 $INSTALL_DIR/main.py'" >> "$SHELL_PROFILE"
fi

echo ""
echo "Git AI Helper installed."
echo "Run: source $SHELL_PROFILE"
echo "Then start it anytime by typing: git-ai"