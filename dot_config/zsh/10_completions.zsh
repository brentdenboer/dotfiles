# Completion System Setup
# -----------------------

loc=${ZDOTDIR:-"$HOME/.config/zsh"}
fpath=($loc/completion $fpath)

autoload -Uz compinit && compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"

[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' auto-description 'specify: %d'

zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'

zstyle ':completion:*' menu select=long
zstyle ':completion:*' list-prompt %SAt %p: hit TAB for more, or the character to insert%s
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s

if [[ -n "$LS_COLORS" ]]; then
  zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
else
  zstyle ':completion:*' list-colors ''
fi
