# Setup the PATH for pyenv binaries and shims
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if type -a pyenv > /dev/null; then
    eval "$(pyenv init --path)"
fi
