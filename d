# -*- mode: sh -*-

fasd -dlR "$*" \
    | fzf \
          --no-sort \
          --no-multi \
          -1 \
          --query="$*" \
    | read -r _fzf_out
[ -z "$_fzf_out" ] && return
cd "$_fzf_out" || return
