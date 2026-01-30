
# -------------------------------------------
# zsh configuration
# ------------------------------------------

# Enable Vim Keybindings
bindkey -v

# Cursor Customization
print -n "\e[2 q"



# --------------------------------------------
# Custom zsh Prompt
# --------------------------------------------
setopt prompt_subst

# Color palette (Zsh prompt escapes)
RESET="%f%k"
CYAN="%F{87}"
YELLOW="%F{226}"
MAGENTA="%F{129}"

# Git branch function (updates every prompt)
git_branch() {
  local branch
  branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null) || return
  [[ -n "$branch" ]] && echo "${YELLOW}[$branch]${RESET}"
}

# SSH status function
ssh_badge() {
  [[ -n "$SSH_CONNECTION$SSH_CLIENT$SSH_TTY" ]] || return

  local host client
  host="%m"  # zsh prompt escape for short hostname

  # If you want the client IP too (optional)
  if [[ -n "$SSH_CONNECTION" ]]; then
    client="${SSH_CONNECTION%% *}"   # first field is client IP
  elif [[ -n "$SSH_CLIENT" ]]; then
    client="${SSH_CLIENT%% *}"
  fi

  # badge
  if [[ -n "$client" ]]; then
    echo "%F{208}[ssh@${host}←${client}]%f"
  else
    echo "%F{208}[ssh@${host}]%f"
  fi
}


# Define lambda based on user type
if [[ $EUID -eq 0 ]]; then
  LAMBDA="λ (root)"
else
  LAMBDA="λ"
fi


# Define prompt with two lines (IMPORTANT: keep $(git_branch) literal)
PROMPT='${CYAN}%~/ $(git_branch)${RESET}
${MAGENTA}${LAMBDA} ${RESET}'

precmd() { echo "" }




# -------------------------------------------------
# Node Version Manager Config... enable completion
# -------------------------------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# -----------------------------------
# env variables for CSCE441 Graphics
# -----------------------------------
export GLM_INCLUDE_DIR=/usr/include
export GLFW_DIR=/usr
export GLEW_DIR=/usr
