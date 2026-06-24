# This script file is used for my keymap

if (( $+commands[yazi] )); then
  function yy() {
    emulate -L zsh

    local tmp cwd yazi_status
    tmp="$(mktemp -t yazi-cwd.XXXXXX)" || return

    command yazi "$@" --cwd-file="$tmp"
    yazi_status=$?

    if [[ -f "$tmp" ]]; then
      cwd="$(<"$tmp")"
      command rm -f -- "$tmp"
    fi

    if [[ -n "$cwd" && "$cwd" != "$PWD" ]]; then
      builtin cd -- "$cwd" || return
    fi

    return "$yazi_status"
  }

  function _yazi_zle_widget() {
    zle -I
    yy
    zle reset-prompt
  }

  if [[ -o interactive ]]; then
    zle -N yazi-cd-widget _yazi_zle_widget
    bindkey "${YAZI_ZLE_KEY:-^Y}" yazi-cd-widget
  fi
fi

