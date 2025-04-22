# Completion System Setup
# -----------------------
# Load completions system only once a day to improve startup time
autoload -Uz compinit
() {
  # Check if cache file exists and is not a day old
  if [[ -n "$XDG_CACHE_HOME" ]]; then
    ZCOMPDIR="$XDG_CACHE_HOME/zsh"
  else
    ZCOMPDIR="$HOME/.cache/zsh"
  fi
  mkdir -p "$ZCOMPDIR"
  ZCOMPFILE="$ZCOMPDIR/zcompdump-$ZSH_VERSION"

  # Only rebuild if older than 24h
  if [[ -f "$ZCOMPFILE" && $(find "$ZCOMPFILE" -mtime +1) ]]; then
    compinit -d "$ZCOMPFILE"
    # Optimize the completion dump file
    zcompile "$ZCOMPFILE"
  else
    # If file doesn't exist or is less than a day old
    compinit -C -d "$ZCOMPFILE"
  fi
}

# Completion styling
zstyle ':completion:*' menu select=2 scroll=0
zstyle ':completion:*:*:*:*:*' menu select=long
zstyle ':completion:*:descriptions' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format ' %F{yellow}%d%f'
zstyle ':completion:*:warnings' format ' %F{red}No matches for:%f %d'
zstyle ':completion:*:corrections' format ' %F{green}%d (errors: %e)%f'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
#zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# PNPM Completion
if type compdef &>/dev/null; then
  _pnpm_completion() {
    local reply
    local si=$IFS

    IFS=$'\n' reply=($(COMP_CWORD="$((CURRENT-1))" COMP_LINE="$BUFFER" COMP_POINT="$CURSOR" SHELL=zsh pnpm completion-server -- "${words[@]}"))
    IFS=$si

    if [ "$reply" = "__tabtab_complete_files__" ]; then
      _files
    else
      _describe 'values' reply
    fi
  }
  compdef _pnpm_completion pnpm
fi
