# Functions
# ---------
reset-project() {
  echo "WARNING: Preparing to recursively delete node_modules, dist, .turbo in subdirectories."
  echo "Current directory: $(pwd)"
  read -q "REPLY?Proceed? (y/N) "
  echo

  [[ ! "$REPLY" =~ ^[Yy]$ ]] && {
    echo "Reset cancelled."
    return 1
  }

  echo "Searching for and deleting directories..."

  local dirs_to_remove=("node_modules" "dist" ".turbo")
  local removed=0

  for dir in "${dirs_to_remove[@]}"; do
    echo "Looking for ${dir} directories..."
    local found=$(find . -type d -name "$dir" -prune)
    if [[ -n "$found" ]]; then
      find . -type d -name "$dir" -prune -exec echo "Removing {}..." \; -exec rm -rf {} \;
      ((removed++))
    else
      echo "No $dir directories found."
    fi
  done

  echo "Reset finished. Removed $removed directory types."
}
