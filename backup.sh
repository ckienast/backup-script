#!/bin/bash

### Varibales
DOTFILES="configs/dotfiles"
VSCODE="configs/vscode"

### Cleanup previous backups
rm -rf configs

### Create folders
mkdir configs
mkdir configs/dotfiles
mkdir configs/vscode

### Backup dotfiles
echo "Backing up zsh"
cp ~/.zsh_history $DOTFILES/
cp ~/.zshrc $DOTFILES/
echo "Backing up gitconfig"
cp ~/.gitconfig $DOTFILES/
cp ~/.gitignore_global $DOTFILES/
echo "Backing up hyper.js"
cp ~/.hyper.js $DOTFILES/
echo "Backing up ssh"
cp -rf ~/.ssh $DOTFILES/

### Backup VSCode user data and extensions list
echo "Backing up VSCode user data"
cp -rf ~/Library/Application\ Support/Code/User/*.json $VSCODE/
echo "Backing up VSCode extensions list"
code --list-extensions > $VSCODE/extensions

### Finish
echo ""
echo "Backup successful"
exit 1
