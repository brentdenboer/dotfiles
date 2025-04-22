# Zinit Setup
# -----------
ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"
# Source Zinit itself
source "$ZINIT_HOME/zinit.zsh"

# Zinit Plugins (Turbo mode for faster loading)
# ---------------------------------------------
zinit ice wait lucid
zinit light zsh-users/zsh-completions

zinit ice wait lucid
zinit light MichaelAquilina/zsh-you-should-use

zinit ice wait lucid
zinit light zsh-users/zsh-autosuggestions

zinit light zsh-users/zsh-syntax-highlighting
