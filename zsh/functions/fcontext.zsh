fcontext() {
  local file
  local cleanup=0
  local context="${FCONTEXT_LINES:-15}"

  if (( $# > 0 )) && [[ -f "$1" ]]; then
    file="$1"
  elif [[ ! -t 0 ]]; then
    file="$(mktemp)"
    cleanup=1
    cat > "$file"
  else
    print -u2 "Usage: fcontext <file>"
    print -u2 "   or: command | fcontext"
    return 1
  fi

  awk '{ printf "%d\t%s\n", NR, $0 }' "$file" |
    fzf \
      --ansi \
      --delimiter=$'\t' \
      --with-nth=2.. \
      --layout=reverse \
      --border \
      --info=inline \
      --prompt='Search > ' \
      --header='Ctrl-/: toggle preview' \
      --preview="
        line={1}
        start=\$((line - $context))
        end=\$((line + $context))

        (( start < 1 )) && start=1

        bat \
          --color=always \
          --style=numbers \
          --highlight-line \"\$line\" \
          --line-range \"\${start}:\${end}\" \
          \"$file\"
      " \
      --preview-window='right,60%,wrap' \
      --bind='ctrl-/:toggle-preview'

  local status=$?

  (( cleanup )) && rm -f "$file"

  return "$status"
}
