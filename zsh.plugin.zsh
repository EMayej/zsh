export EDITOR="emacsclient --no-wait"

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

autoload -Uz f
autoload -Uz d
autoload -Uz e
