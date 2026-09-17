# Enable Vim Keybindings
bindkey -v

# Cursor Customization
print -n "\e[2 q"

# Uses fzf for ctrl+r terminal history lookup
source <(fzf --zsh)
