# This script file is used for environment  

[ -f "$HOME/.config/zsh/secrets.zsh" ] && source "$HOME/.config/zsh/secrets.zsh"

# USE_MAGIC=true # whether to use magicmace theme
# Save command history
HISTFILE=${ZDOTDIR:-$HOME}/.cache/zsh/history
HISTSIZE=2000
SAVEHIST=1000

# Standard XDG variables
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
mkdir -p "$XDG_CACHE_HOME" "$XDG_CONFIG_HOME" "$XDG_DATA_HOME" "$XDG_STATE_HOME"

export JUPYTER_CONFIG_DIR="$XDG_CACHE_HOME/jupyter"
export JUPYTER_RUNTIME_DIR="$XDG_CACHE_HOME/jupyter/runtime"
export JUPYTER_DATA_DIR="$XDG_CACHE_HOME/jupyter"
export IPYTHONDIR="$XDG_CACHE_HOME/ipython"
export MPLCONFIGDIR="$XDG_CACHE_HOME/matplotlib"

# language cache dir
# export PYTHONPYCACHEPREFIX="$XDG_CACHE_HOME/python"
# export GOPATH="$HOME/Developer/toolchains/go"
# export GOCACHE="$XDG_CACHE_HOME/go/build"
# export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
# export RUSTUP_HOME="$XDG_CACHE_HOME/rustup"
# export CARGO_HOME="$XDG_CACHE_HOME/cargo"
# export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"

# deep learning cache dir
# export TORCH_HOME="$XDG_CACHE_HOME/torch"
# export TRITON_CACHE_DIR="$XDG_CACHE_HOME/triton"
# export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"
# export TILELANG_CACHE_DIR="$XDG_CACHE_HOME/tilelang"


# Node.js, fnm, pnpm configuration
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"
export PATH="$XDG_DATA_HOME/fnm/aliases/default/bin:$PATH"
export PNPM_HOME="$XDG_DATA_HOME/pnpm"
export PATH="$PNPM_HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"




