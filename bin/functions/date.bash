function days-ago {
  local days=$1
  local current_seconds="$(date +%s)"
  date -r $(echo "$current_seconds - ($days * 24 * 60 * 60)" | bc)
}
