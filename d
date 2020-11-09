# -*- mode: sh -*-
#
# Find directory in fasd and cd into.

local dir

fasd -dlR "$*" \
    | fzf \
          --no-multi \
          -1 \
          --query="$*" \
          --preview='exa --color=always -lbF {}' \
    | read -r dir
[ -z "$dir" ] && return
cd "$dir" || return
