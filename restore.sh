#!/bin/bash

### Varibales
DOTFILES="configs/dotfiles"
VSCODE="configs/vscode"

# Check for existing configs
if [[ ! -d configs ]]; then
  echo "No previous backups found"
  exit
fi

### Restore dotfiles
echo "Restoring up zsh"
cp $DOTFILES/.zsh_history ~/
cp $DOTFILES/.zshrc ~/
echo "Restoring up gitconfig"
cp $DOTFILES/.gitconfig ~/
cp $DOTFILES/.gitignore_global ~/
echo "Restoring up hyper.js"
cp $DOTFILES/.hyper.js ~/
echo "Restoring up ssh"
cp -rf $DOTFILES/.ssh ~/



### Restore VSCode user data and extensions list
echo "Restoring VSCode user data"
cp -rf $VSCODE/*.json ~/Library/Application\ Support/Code/User/
echo "Restoring VSCode extensions"
while IFS= read -r line; do
  code --install-extension $line
done < $VSCODE/extensions

### Finish
echo ""
echo "Restore successful"
exit 1
