# -*- mode: sh -*-
#
# Find a directory interactively in fasd with fzf and cd into it.

local dir

fasd -dlR "$*" \
    | fzf \
          --no-multi \
          -1 \
          --preview='exa --color=always {}' \
    | read -r dir
[ -z "$dir" ] && return
cd "$dir" || return
