#!/bin/zsh

# Exit on any error
set -e

# Functions
backup() {
  local target=$1
  if [[ -e "$target" && ! -L "$target" ]]; then
    mv "$target" "$target.backup"
    echo "-----> Moved your old $target config file to $target.backup"
  else
    echo "-----> No backups needed"
  fi
}


symlink() {
  local file=$1
  local link=$2
  if [ ! -e "$link" ]; then
    echo "-----> Symlinking your new $link"
    ln -s $file $link
  else
    echo "-----> $link already exists"
  fi
}

install_zsh_plugins() {
  local plugins_dir="$HOME/.oh-my-zsh/custom/plugins"
  mkdir -p "$plugins_dir" && cd "$plugins_dir"
  if [ ! -d "zsh-syntax-highlighting" ]; then
    echo "-----> Installing zsh plugins..."
    git clone https://github.com/zsh-users/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting
  fi
  cd "$1"
}

# Symlink config files
for name in aliases gitconfig zprofile zshrc; do
  if [ ! -d "$name" ]; then
    target_path="$HOME/.$name"
    backup $target_path
    symlink $PWD/$name $target_path
  fi
done

install_zsh_plugins $PWD

# Determine OS and set VS Code path accordingly
code_path=""
if [[ `uname` =~ "Darwin" ]]; then
  code_path=~/Library/Application\ Support/Code/User
else
  code_path=~/.config/Code/User
  [[ ! -e $code_path ]] && code_path=~/.vscode-server/data/Machine
fi

# Symlink VS Code settings
if [ -d "$code_path" ]; then
  for name in settings.json keybindings.json; do
    target_vscode="$code_path/$name"
    backup $target_vscode
    symlink $PWD/$name $target_vscode
  done
else
  echo "-----> VS Code path not found, skipping symlink creation"
fi

# Handle macOS specifics
if [[ `uname` =~ "Darwin" ]]; then
  target=~/.ssh/config
  backup $target
  symlink $PWD/config $target
  ssh-add -K ~/.ssh/id_ed25519
fi

# Symlink Zsh theme
symlink $PWD/LENICO.zsh-theme "$HOME/.oh-my-zsh/themes/LENICO.zsh-theme"

# Symlink the .ssh folder on WSL to the .ssh folder on Windows
# if [[ `uname` =~ "MINGW" ]]; then
#   echo "System is Windows"
#   echo "-----> Symlinking your new .ssh folder"
#   target=~/.ssh
#   backup $target
#   symlink /mnt/c/Users/david/.ssh $target
#   echo ""
# else
#   echo "System is not Windows"
#   echo""
# fi

echo "-----> Done!"
