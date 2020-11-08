# -*- mode: sh -*-
#
# Find file under current directory and open it with emacsclient.

local file

fd \
    --type=f \
    --hidden \
    --exclude={.git,build} \
    | fzf \
          --no-sort \
          --no-multi \
          -1 \
          --query="$*" \
          --preview='bat --style=numbers --color=always --line-range :500 {}' \
    | read file
[ -z "$file" ] && return
emacsclient --no-wait "$file"
