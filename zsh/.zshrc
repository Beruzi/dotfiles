# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Load all config modules (ordered)
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Keybindings
source "$HOME/.config/zsh/keybindings.zsh"

# Prompt
source "$HOME/.config/zsh/prompt.zsh"

# Environment
source "$HOME/.config/zsh/env.zsh"

# Environment
source "$HOME/.config/zsh/completion.zsh"

# Aliases
source "$HOME/.config/zsh/aliases.zsh"

# Custom functions
for file in "$HOME"/.config/zsh/functions/*.zsh(N); do
    source "$file"
done


### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/michael/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
