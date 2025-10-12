#!/usr/bin/env sh
# remote_host.sh — Extract the remote host from an ssh or mosh foreground process on a given TTY
# Usage: remote_host.sh <pane_tty> <pane_current_command>
# Prints the best-effort hostname (or user@host stripped to host) to stdout.
# If no host can be determined, prints nothing (tmux will fall back to #W per config).

TTY="$1"
CMD="$2"
TTY=${TTY#/dev/}

case "$CMD" in
  ssh) MODE=ssh ;;
  mosh|mosh-client) MODE=mosh ;;
  *) MODE="" ;;
esac

# If it's not ssh or mosh, nothing to do
[ -n "$MODE" ] || exit 0

# macOS/BSD ps supports: ps -t <tty> -o comm=,args=
# Linux ps supports the same. We parse by awk for robustness.
ps -t "$TTY" -o comm=,args= 2>/dev/null | awk -v mode="$MODE" '
  $1=="ssh" && mode=="ssh" {
    host=""
    for (i=2; i<=NF; i++) {
      if ($i ~ /^-/) continue        # skip options like -p, -i, -J
      if ($i == "ssh") continue
      host=$i; break                 # first non-option token is the destination
    }
    sub(/^[^@]+@/, "", host)        # strip user@
    gsub(/^"+|"+$/, "", host)      # strip surrounding double quotes
    gsub(/^'\''+|'\''+$/, "", host)   # strip surrounding single quotes
    if (host != "") { print host; exit }
  }
  $1 ~ /^mosh/ && mode=="mosh" {
    host=""
    for (i=2; i<=NF; i++) {
      if ($i == "--") continue
      if ($i ~ /^-/) continue        # skip options
      if ($i ~ /^[0-9]+$/) continue  # skip port numbers
      if ($i ~ /^mosh(-client)?$/) continue
      host=$i; break                 # first plausible host token
    }
    sub(/^[^@]+@/, "", host)        # strip user@
    gsub(/^"+|"+$/, "", host)      # strip surrounding double quotes
    gsub(/^'\''+|'\''+$/, "", host)   # strip surrounding single quotes
    if (host != "") { print host; exit }
  }
'
