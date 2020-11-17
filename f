# -*- mode: sh -*-

local file

fasd -flR "$*" \
    | fzf \
          --no-sort \
          --no-multi \
          -1 \
          --preview='bat --style=numbers --color=always --line-range :500 {}' \
    | read -r file
[ -z "$file" ] && return
emacsclient --no-wait "$file"
