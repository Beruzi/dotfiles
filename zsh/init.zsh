# Keybindings
source "$HOME/.config/zsh/keybindings.zsh"

# Prompt
source "$HOME/.config/zsh/prompt.zsh"

# Environment
source "$HOME/.config/zsh/env.zsh"

# Completion
source "$HOME/.config/zsh/completion.zsh"

# Aliases
source "$HOME/.config/zsh/aliases.zsh"

# Custom functions
for file in "$HOME"/.config/zsh/functions/*.zsh(N); do
    source "$file"
done
