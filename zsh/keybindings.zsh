# Enable Vim Keybindings
bindkey -v

# Let Backspace delete text from before insert mode was entered
bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^H' backward-delete-char

# Cursor Customization
print -n "\e[2 q"

# Uses fzf for ctrl+r terminal history lookup
source <(fzf --zsh)
