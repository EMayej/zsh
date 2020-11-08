# -*- mode: sh -*-
#
# Find file under current directory and open it with emacsclient.

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
    | read _fzf_out
[ -z "$_fzf_out" ] && return
emacsclient --no-wait "$_fzf_out"
