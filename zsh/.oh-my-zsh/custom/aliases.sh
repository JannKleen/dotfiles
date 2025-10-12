# Halting all docker containers in a box and then halting the box
# TODO should actually check if they're still running
#alias vgh="vagrant halt && vagrant halt \`vagrant global-status | grep default | grep -E \$(pwd)'\s*$' | awk '{print \$1}'\`"
alias cup="brew cask list | xargs brew cask install --force"
alias snake="VERSIONER_PYTHON_PREFER_32_BIT=yes pythonw \`which runsnake32\`"

alias pre-commit="nocorrect pre-commit"

if [[ -x "/usr/local/bin/rsync" ]]
then
    alias rsync='/usr/local/bin/rsync'
fi

# Default to reattaching the last Screen session when running `screen` with no args.
# If a session exists, this recovers it; otherwise, it creates a new one.
# Any arguments passed to `screen` are forwarded unchanged.
screen() {
  if [[ $# -eq 0 ]]; then
    command screen -D -RR
  else
    command screen "$@"
  fi
}
