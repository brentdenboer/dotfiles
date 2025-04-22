# Prompt Configuration
# --------------------
autoload -Uz vcs_info
precmd() {
  vcs_info
}
zstyle ':vcs_info:git:*' formats '%F{red}%b%f%F{green}%c%F{yellow}%u%f '
zstyle ':vcs_info:git:*' actionformats '%F{red}%b%f (%F{yellow}%a%f)%F{green}%c%F{yellow}%u%f '
PROMPT='%F{blue}%~%f${vcs_info_msg_0_}$'
