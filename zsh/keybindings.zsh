# Enable Vim Keybindings
bindkey -v

# Let Backspace delete text from before insert mode was entered
bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^H' backward-delete-char

# Match the cursor to the vi editing mode.
autoload -Uz add-zle-hook-widget

_vi_mode_cursor() {
  case $KEYMAP in
    vicmd|visual) printf '\e[2 q' ;; # Steady block in normal/visual mode
    *)            printf '\e[5 q' ;; # Blinking bar in insert mode
  esac
}

_vi_mode_cursor_finish() {
  printf '\e[2 q' # Restore the block before running a command
}

add-zle-hook-widget line-init _vi_mode_cursor
add-zle-hook-widget keymap-select _vi_mode_cursor
add-zle-hook-widget line-finish _vi_mode_cursor_finish

# Uses fzf for ctrl+r terminal history lookup
source <(fzf --zsh)
