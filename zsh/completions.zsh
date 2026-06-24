# This script file is used for zsh completion


# loading plugins for auto completion and syntax highlighting
# specifying the location of dump files, the location of the zcompcache folder, 
# and the search path for completion functions
for dir in "/opt/homebrew/share/zsh/site-functions/" \
           "$HOME/.config/zsh/site-functions/"; do

  [[ -d "$dir" ]] && fpath+=("$dir")

done

mkdir -p "$HOME/.cache/zsh/"
autoload -Uz compinit && compinit -C -d "$HOME/.cache/zsh/zcompdump"
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$HOME/.cache/zsh/zcompcache"

for plugin in "$HOME/.config/zsh/plugins/fzf-tab" \
              "$HOME/.config/zsh/plugins/zsh-history-substring-search" \
              "$HOME/.config/zsh/plugins/zsh-autosuggestions" \
              "$HOME/.config/zsh/plugins/fast-syntax-highlighting"; do

  [[ -d "$plugin" ]] && source "$plugin"/*.plugin.zsh

done


command -v fzf &> /dev/null && source <(fzf --zsh)
command -v pnpm &> /dev/null && source <(pnpm completion zsh)


