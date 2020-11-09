# -*- mode: sh -*-
#
# Find directory under current directory and cd into.

local dir

fd \
    --type=d \
    --hidden \
    --exclude={.git,build} \
    | fzf \
          --no-multi \
          -1 \
          --query="$*" \
          --preview='exa --color=always -lbF {}' \
    | read dir
[ -z "$dir" ] && return
cd "$dir" || return
