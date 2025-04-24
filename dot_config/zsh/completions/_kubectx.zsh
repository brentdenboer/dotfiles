#compdef kubectx kctx=kubectx

_kubectx() {
  local KUBECTX="${HOME}/.kube/kubectx"
  local PREV=""
  local context_array
  local all_contexts

  context_array=("${(@f)$(kubectl config get-contexts --output='name')}")
  # Ensure contexts with spaces are handled correctly if needed, though names usually don't have them.
  # Using single quotes inside might be problematic, let's rely on Zsh's array handling.
  all_contexts=("${context_array[@]}")

  # Add '-' option if previous context exists
  if [[ -f "$KUBECTX" && -n "$(cat "$KUBECTX")" ]]; then
      all_contexts=('-' "${all_contexts[@]}")
  fi

  _arguments \
    '1:context:->contexts' \
    '*::contexts:->contexts' \
    '(-d --delete):delete context:->contexts' \
    && return 0

  # Provide the list of contexts
  _describe 'contexts' all_contexts
}
