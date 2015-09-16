# Halting all docker containers in a box and then halting the box
# TODO should actually check if they're still running
alias vgh="vagrant halt && vagrant halt \`vagrant global-status | grep default | grep -E \$(pwd)'\s*$' | awk '{print \$1}'\`"
