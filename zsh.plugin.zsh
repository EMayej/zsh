setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS

export EDITOR=emacsclient

autoload -Uz take

alias cat=bat

fasd_cache="${ZSH_CACHE_DIR}/fasd-init-cache"
if [[ "$commands[fasd]" -nt "$fasd_cache" || ! -s "$fasd_cache" ]]; then
    fasd --init zsh-hook >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache

export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude={.git,build}'
export FZF_DEFAULT_OPTS="--height=40% --layout=reverse --border"

autoload -Uz c
autoload -Uz d
autoload -Uz e
autoload -Uz f

# edit command line in EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

# save or load pet snippets
autoload -Uz pet-save
autoload -Uz pet-load
zle -N pet-load
bindkey '^l' pet-load

# git aliases
alias gd="git diff"
alias gf="git fetch --all"
alias gr='cd $(git rev-parse --show-toplevel)'
alias gst="git status -s"
alias gt="git log --graph --format='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen%an%Creset %C(bold blue)%cr%Creset' --all"
alias gu="git pull --rebase --autostash"

# https://github.com/DarrinTisdale/zsh-aliases-exa
alias ls='exa'
alias l='exa -lbF --git'                    # list, size, type, git
alias ll='exa -lbGF --git'                  # long list
alias llm='exa -lbGF --git --sort=modified' # long list, modified date sort
alias la='exa -lbhHigUmuSa --time-style=long-iso --git --color-scale' # all list
alias lx='exa -lbhHigUmuSa@ --time-style=long-iso --git --color-scale' # all + extended list
alias lt='exa --tree --level=2' # tree
