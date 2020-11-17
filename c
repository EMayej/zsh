# -*- mode: sh -*-
#
# Find directory under current directory and cd into.

local dir

fd \
    --type=d \
    --hidden \
    --exclude={.git,build} \
    "$*" \
    | fzf \
          --no-multi \
          -1 \
          --preview='exa --color=always {}' \
    | read dir
[ -z "$dir" ] && return
cd "$dir" || return
