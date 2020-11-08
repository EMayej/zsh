# -*- mode: sh -*-

local dir

fasd -dlR "$*" \
    | fzf \
          --no-sort \
          --no-multi \
          -1 \
          --query="$*" \
    | read -r dir
[ -z "$dir" ] && return
cd "$dir" || return
