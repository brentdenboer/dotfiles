#!/usr/bin/env fish

function loadhosts
    sudo hostctl replace "$argv[1]" -f .etchosts
end
