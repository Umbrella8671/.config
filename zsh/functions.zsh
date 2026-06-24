# This script file is used for my custom functions


# Auto-select lsd colors from the current macOS appearance.
# Copy this into ~/.config/zsh/functions.zsh.

lsd() {
  local lsd_config_root="${LSD_AUTO_CONFIG_HOME:-${XDG_CONFIG_HOME:-$HOME/.config}/lsd}"
  local lsd_mode="${LSD_THEME_MODE:-}"
  local lsd_xdg_home
  local lsd_config_file
  local lsd_ls_colors

  if [[ "$lsd_mode" != "light" && "$lsd_mode" != "dark" ]]; then
    if [[ "$TERM_PROGRAM" == "vscode" ]]; then
      lsd_mode="dark"
    elif [[ "$(uname)" == "Darwin" ]] && defaults read -g AppleInterfaceStyle >/dev/null 2>&1; then
      lsd_mode="dark"
    else
      lsd_mode="light"
    fi
  fi

  if [[ "$lsd_mode" == "light" ]]; then
    lsd_ls_colors="di=38;5;26:ln=38;5;30:ex=38;5;70:pi=38;5;38:so=38;5;38:bd=38;5;166:cd=38;5;166:or=38;5;160:mi=38;5;160:su=38;5;160:sg=38;5;172:tw=38;5;30:ow=38;5;30:st=38;5;172"
  else
    lsd_ls_colors="di=1;38;5;75:ln=38;5;80:ex=1;38;5;120:pi=38;5;80:so=38;5;80:bd=1;38;5;222:cd=1;38;5;222:or=1;38;5;203:mi=1;38;5;203:su=1;38;5;203:sg=1;38;5;220:tw=1;38;5;80:ow=1;38;5;80:st=1;38;5;220"
  fi

  lsd_xdg_home="$lsd_config_root/$lsd_mode"
  lsd_config_file="$lsd_xdg_home/lsd/config.yaml"

  if [[ -r "$lsd_config_file" ]]; then
    XDG_CONFIG_HOME="$lsd_xdg_home" LS_COLORS="$lsd_ls_colors" command lsd --config-file "$lsd_config_file" "$@"
  else
    LS_COLORS="$lsd_ls_colors" command lsd "$@"
  fi
}
