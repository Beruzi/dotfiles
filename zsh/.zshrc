# Enable Vim Keybindings
bindkey -v

# Cursor Customization
print -n "\e[2 q"

# Enable prompt command substitution
setopt PROMPT_SUBST

# Git branch function (lightweight)
git_branch() {
  local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  [[ -n "$branch" ]] && echo "${YELLOW}[$branch]${RESET}"
}

# Define lambda based on user type
if [[ $EUID -eq 0 ]]; then
  LAMBDA="λ (root)"
else
  LAMBDA="λ"
fi

# Color palette (Zsh prompt escapes)
RESET="%f%k"
CYAN="%F{87}"
YELLOW="%F{226}"
MAGENTA="%F{129}"

# Define prompt with two lines:
PROMPT="${CYAN}%~/ $(git_branch)${RESET}
${MAGENTA}${LAMBDA} ${RESET}"

precmd() { echo "" }

