setopt prompt_subst

# Color palette
RESET="%f%k"
CYAN="%F{87}"
YELLOW="%F{226}"
MAGENTA="%F{129}"
GREEN="%F{46}"

# Display the current Git branch
git_branch() {
  local branch

  branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null) || return

  [[ -n "$branch" ]] && echo "${YELLOW}[$branch]${RESET}"
}

# Display an SSH connection badge
ssh_badge() {
  [[ -n "$SSH_CONNECTION$SSH_CLIENT$SSH_TTY" ]] || return

  local host client
  host="%m"

  if [[ -n "$SSH_CONNECTION" ]]; then
    client="${SSH_CONNECTION%% *}"
  elif [[ -n "$SSH_CLIENT" ]]; then
    client="${SSH_CLIENT%% *}"
  fi

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

# Two-line prompt
PROMPT='${CYAN}%~/ $(ssh_badge) $(git_branch)${RESET}
${MAGENTA}${LAMBDA} ${RESET}'

# Add a blank line before each prompt
precmd() {
  echo ""
}
