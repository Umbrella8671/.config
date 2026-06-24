# This script file is used for custom zsh theme

if [[ "$(uname)" == "Darwin" ]]; then
  # set ls dir color, use env var LSCOLORS
  export LSCOLORS="exgxbxdxcxexexabagacad"
  # set terminal prompt style
  # macOS default PROMPT="%n@%m %1~ %# "
  # 启用颜色支持
  autoload -Uz colors && colors
  # 定义颜色别名（可选）
  PROMPT_BLACK="%{$fg[black]%}"
  PROMPT_RED="%{$fg[red]%}"
  PROMPT_BLUE="%{$fg[blue]%}"
  PROMPT_GREEN="%{$fg[green]%}"
  PROMPT_YELLOW="%{$fg[yellow]%}"
  PROMPT_MAGENTA="%{$fg[magenta]%}"
  PROMPT_CYAN="%{$fg[cyan]%}"
  PROMPT_WHITE="%{$fg[white]%}"
  PROMPT_RESET="%{$reset_color%}"
  PROMPT="%n@%m ${PROMPT_BLUE}%1~${PROMPT_RESET} %# "
fi

if [[ -n "$USE_MAGIC" && "$USE_MAGIC" == "true" ]]; then
  autoload -Uz -- \
    $HOME/.config/zsh/plugins/duration-info/functions/duration-info-precmd \
    $HOME/.config/zsh/plugins/duration-info/functions/duration-info-preexec \
    $HOME/.config/zsh/plugins/git-info/functions/coalesce \
    $HOME/.config/zsh/plugins/git-info/functions/git-action \
    $HOME/.config/zsh/plugins/git-info/functions/git-info \
    $HOME/.config/zsh/plugins/prompt-pwd/functions/prompt-pwd
                    
   source $HOME/.config/zsh/plugins/magicmace/magicmace.zsh-theme
   # zstyle ':zim:git' aliases-prefix 'g'
fi

typeset -U PATH


