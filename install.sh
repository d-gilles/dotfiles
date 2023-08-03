#!/bin/zsh

# Functions
backup() {
  local target=$1
  if [[ -e "$target" && ! -L "$target" ]]; then
    mv "$target" "$target.backup"
    echo "-----> Moved your old $target config file to $target.backup"
  fi
}

symlink() {
  local file=$1
  local link=$2
  if [ ! -e "$link" ]; then
    echo "-----> Symlinking your new $link"
    ln -s $file $link
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
for name in settings.json keybindings.json; do
  local target="$code_path/$name"
  backup $target
  symlink $PWD/$name $target
done

# Handle macOS specifics
if [[ `uname` =~ "Darwin" ]]; then
  target=~/.ssh/config
  backup $target
  symlink $PWD/config $target
  ssh-add -K ~/.ssh/id_ed25519
fi

# Symlink Zsh theme
symlink $PWD/LENICO.zsh-theme "$HOME/.oh-my-zsh/themes/LENICO.zsh-theme"

# Check computer name
if [[ $(hostname) == LENICO* ]]; then
    echo "Computer is LENICO"
else
    echo "Computer is not LENICO"
fi

# Activate new configuration
exec zsh
