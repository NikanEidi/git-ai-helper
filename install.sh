#!/bin/bash

set -e

REPO_URL="https://github.com/NikanEidi/git-ai-helper"
INSTALL_DIR="$HOME/.git-ai-helper"
VENV_DIR="$INSTALL_DIR/venv"
ALIAS_NAME="git-ai"
SHELL_PROFILE=""

# Detect shell profile
if [ -n "$ZSH_VERSION" ]; then
    SHELL_PROFILE="$HOME/.zshrc"
elif [ -n "$BASH_VERSION" ]; then
    SHELL_PROFILE="$HOME/.bashrc"
else
    echo "Unsupported shell. Please manually add the alias to your shell profile."
fi

# Clone or pull latest repo
if [ -d "$INSTALL_DIR" ]; then
    echo "Updating existing Git AI Helper..."
    cd "$INSTALL_DIR" && git pull origin main
else
    echo "Cloning Git AI Helper..."
    git clone "$REPO_URL" "$INSTALL_DIR"
fi

# Create virtual environment if not exist
if [ ! -d "$VENV_DIR" ]; then
    echo "Creating virtual environment..."
    python3 -m venv "$VENV_DIR"
fi

# Activate venv and install requirements
echo "Installing Python dependencies inside virtual environment..."
source "$VENV_DIR/bin/activate"
pip install --upgrade pip
pip install -r "$INSTALL_DIR/requirements.txt"
deactivate

# Add alias
if ! grep -q "$ALIAS_NAME" "$SHELL_PROFILE"; then
    echo "Adding alias to $SHELL_PROFILE..."
    echo "alias $ALIAS_NAME='source $VENV_DIR/bin/activate && python3 $INSTALL_DIR/main.py'" >> "$SHELL_PROFILE"
    source "$SHELL_PROFILE"
fi

echo ""
echo "Git AI Helper installed successfully."
echo "You can run it by typing: git-ai"
echo "If the command is not found, run: source $SHELL_PROFILE or restart your terminal."