# -*- mode: sh -*-

fasd -flR "$*" \
    | fzf \
          --no-sort \
          --no-multi \
          -1 \
          --query="$*" \
          --preview='bat --style=numbers --color=always --line-range :500 {}' \
    | read -r _fzf_out
[ -z "$_fzf_out" ] && return
emacsclient --no-wait "$_fzf_out"
