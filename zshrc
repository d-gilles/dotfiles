# Set the Oh-My-Zsh path and theme
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="LENICO"

# Plugins for Oh-My-Zsh
plugins=(
    gitfast
    last-working-dir
    common-aliases
    zsh-syntax-highlighting
    history-substring-search
    pyenv ssh-agent
    direnv
    sudo
)

# Disable warning about insecure completion-dependent directories
ZSH_DISABLE_COMPFIX=true

# Load Oh-My-Zsh
source "${ZSH}/oh-my-zsh.sh"

# Unalias potentially overridden commands
unalias rm  # Restore default rm behavior
unalias lt  # Needed for localtunnel

# Load pyenv and set Python settings
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
if type -a pyenv > /dev/null; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

# Source custom aliases if the file exists
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"

# Encoding and Editor Settings
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export BUNDLER_EDITOR=code
export EDITOR=code

# Set default Python debugger
export PYTHONBREAKPOINT=ipdb.set_trace

# Google Cloud Platform and Python Paths
export GOOGLE_APPLICATION_CREDENTIALS="/home/david/.google/credentials/google_credentials.json"
export PYTHONPATH="/home/david/code/lewagon/data/04-Decision-Science/01-Project-Setup/context-and-setup"

# Direnv hook for zsh
eval "$(direnv hook zsh)"

# Terraform Bash Completion
if type -a terraform > /dev/null; then
    autoload -U +X bashcompinit && bashcompinit
    complete -o nospace -C /usr/bin/terraform terraform
fi

# Set Browser for GitHub
export BROWSER="/mnt/c/Program Files/Google/Chrome/Application/chrome.exe"
export GH_BROWSER="'/mnt/c/Program Files/Google/Chrome/Application/chrome.exe'"

# Greet the user
_name=$(echo $USER | awk '{print toupper(substr($0,1,1))substr($0,2)}')
echo "👋  Hi $_name, welcome back to your terminal. Let's code something amazing today! 🚀"
