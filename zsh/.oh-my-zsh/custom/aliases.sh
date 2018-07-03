# Halting all docker containers in a box and then halting the box
# TODO should actually check if they're still running
alias vgh="vagrant halt && vagrant halt \`vagrant global-status | grep default | grep -E \$(pwd)'\s*$' | awk '{print \$1}'\`"
alias cup="brew cask list | xargs brew cask install --force"
alias snake="VERSIONER_PYTHON_PREFER_32_BIT=yes pythonw \`which runsnake32\`"
alias bubo='brew update && brew outdated'
alias bubc='brew upgrade && brew cleanup'
alias bubu='bubo && bubc'
