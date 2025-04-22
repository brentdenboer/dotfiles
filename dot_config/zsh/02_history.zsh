# History Configuration
# ---------------------
state_home="${XDG_STATE_HOME:-$HOME/.local/state}"
mkdir -p "$state_home/zsh"
export HISTFILE="$state_home/zsh/history"
unset state_home
HISTSIZE=100000
SAVEHIST=100000
setopt EXTENDED_HISTORY       # Save timestamp
setopt INC_APPEND_HISTORY     # Add commands as they are typed
setopt SHARE_HISTORY          # Share history between sessions
setopt HIST_EXPIRE_DUPS_FIRST # Remove duplicates first when trimming
setopt HIST_IGNORE_ALL_DUPS   # Remove older duplicate entries
setopt HIST_IGNORE_DUPS       # Ignore duplicates of previous event
setopt HIST_IGNORE_SPACE      # Ignore commands beginning with space
setopt HIST_SAVE_NO_DUPS      # Don't save duplicates
setopt HIST_FIND_NO_DUPS      # Don't display duplicates in search
setopt HIST_REDUCE_BLANKS     # Remove superfluous blanks
