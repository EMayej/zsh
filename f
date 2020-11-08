# -*- mode: sh -*-

local file

fasd -flR "$*" \
    | fzf \
          --no-sort \
          --no-multi \
          -1 \
          --query="$*" \
          --preview='bat --style=numbers --color=always --line-range :500 {}' \
    | read -r file
[ -z "$file" ] && return
emacsclient --no-wait "$file"
