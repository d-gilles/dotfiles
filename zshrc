
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="LENICO"

# Useful oh-my-zsh plugins for Le Wagon bootcamps
# source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
plugins=(
        gitfast
        last-working-dir
        common-aliases
        zsh-syntax-highlighting
        history-substring-search
        pyenv ssh-agent
        direnv
        sudo)

# Disable warning about insecure completion-dependent directories
ZSH_DISABLE_COMPFIX=true

# Actually load Oh-My-Zsh
source "${ZSH}/oh-my-zsh.sh"
unalias rm # No interactive rm by default (brought by plugins/common-aliases)
unalias lt # we need `lt` for https://github.com/localtunnel/localtunnel


# Load pyenv (to manage your Python versions)
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
type -a pyenv > /dev/null && eval "$(pyenv init -)" && eval "$(pyenv virtualenv-init -)" #&& RPROMPT+='🐍 $(pyenv version-name)' && export python_prompt='[🐍 $(pyenv version-name)]'

# Store your own aliases in the ~/.aliases file and load the here.
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"

# Encoding stuff for the terminal
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export BUNDLER_EDITOR=code
export EDITOR=code

# Set ipdb as the default Python debugger
export PYTHONBREAKPOINT=ipdb.set_trace

# Set key for GoogleCloudPlattform as Variable
export GOOGLE_APPLICATION_CREDENTIALS=/home/david/.google/credentials/google_credentials.json
export PYTHONPATH="/home/david/code/lewagon/data/04-Decision-Science/01-Project-Setup/context-and-setup"

# hooking env - Lenico
eval "$(direnv hook zsh)"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform

_name=$(echo $USER | awk '{print toupper(substr($0,1,1))substr($0,2)}')

echo "👋  Hi $_name, welcome back to your terminal. Let's code something amazing today! 🚀"
export BROWSER="/mnt/c/Program Files/Google/Chrome/Application/chrome.exe"
export GH_BROWSER="'/mnt/c/Program Files/Google/Chrome/Application/chrome.exe'"
