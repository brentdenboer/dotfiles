#!/usr/bin/env fish

function reset-project --description "Recursively remove node_modules, dist, and .turbo directories"
    echo "WARNING: Preparing to recursively delete node_modules, dist, .turbo in subdirectories."
    echo "Current directory: "(pwd)
    read --prompt-str="Proceed? (y/N) " --local REPLY
    echo

    if not string match --quiet --regex '^[Yy]$' "$REPLY"
        echo "Reset cancelled."
        return 1
    end

    echo "Searching for directories to remove..."

    set --local dirs_to_remove **/{node_modules,dist,.turbo}/

    if test (count $dirs_to_remove) -eq 0
        echo "No directories (node_modules, dist, .turbo) found to remove."
        return 0
    end

    echo "Found the following directories to remove:"
    for dir in $dirs_to_remove
        echo "- $dir"
    end
    echo

    set --local removed_count 0
    echo "Removing directories..."
    for dir in $dirs_to_remove
        echo "Removing $dir..."
        rm -rf "$dir"
        if test $status -ne 0
            echo "Error removing $dir (status: $status)" >&2
        else
            set removed_count (math $removed_count + 1)
        end
    end

    echo
    echo "Reset finished. Removed $removed_count directories."
    return 0
end
