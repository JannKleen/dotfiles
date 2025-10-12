# Path to your oh-my-zsh installation.
export ZSH=/Users/jann/.oh-my-zsh
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="jann"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Enable auto-setting terminal title (Oh My Zsh default). tmux ignores title changes (allow-rename off).
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent identities id_rsa gitlab google_compute_engine

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(git git-flow-avh nvm aws brew pep8 pip python sudo common-aliases xcode virtualenv virtualenvwrapper vagrant tmux z gpg-agent)
# removed ssh-agent because we're now using gpg-agent

# User configuration

export PATH="/usr/bin/:/usr/sbin/:/usr/local/sbin:/usr/local/bin:/opt/subversion/bin:/usr/local/bin:/bin:/sbin:/opt/X11/bin:/usr/local/share/npm/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'
#if [[ -n $SSH_CONNECTION ]]; then
#  export EDITOR='vim'
#else
#  export EDITOR='mvim'
#fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

# Set up pyenv paths
export PYENV_ROOT="$HOME/.pyenv"
if command -v pyenv >/dev/null; then
  export PATH="$PYENV_ROOT/bin:$PATH"
  export PATH="$PYENV_ROOT/shims:${PATH}"
  eval "$(pyenv init -)"
fi

if [ -e /usr/local/bin/virtualenvwrapper.sh ]; then
        source /usr/local/bin/virtualenvwrapper.sh
fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# Insert custom aliases
source $ZSH_CUSTOM/aliases.sh

# NVM config
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh


bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:/Library/TeX/texbin"
export PATH="/usr/local/bin:$PATH"

# Initialize Jenv
#export PATH="$HOME/.jenv/bin:$PATH"
#eval "$(jenv init -)"


# for automated docker scripts
export GITLAB_KEY_PATH="$HOME/.ssh/gitlab"

source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"

export GOOGLE_APPLICATION_CREDENTIALS=~/.terraform/files/admin/terraform-admin-257610-e323add0ac88.json

export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun completions
[ -s "/Users/jann/.reflex/.bun/_bun" ] && source "/Users/jann/.reflex/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.reflex/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


zstyle ':completion:*' menu select
fpath+=~/.zfunc
