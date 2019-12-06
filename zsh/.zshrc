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
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
#COMPLETION_WAITING_DOTS="true"

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
zstyle :omz:plugins:ssh-agent identities id_rsa id_rsa2 gitlab google_compute_engine

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(git git-flow-avh nvm aws pep8 pip python sudo bower common-aliases osx xcode virtualenv virtualenvwrapper vagrant tmux z django ssh-agent jenv)

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

if [ -e /usr/local/bin/virtualenvwrapper.sh ]; then
        source /usr/local/bin/virtualenvwrapper.sh
fi

# Insert custom aliases
source $ZSH_CUSTOM/aliases.sh

# NVM config
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh


bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
#export PATH="/Users/jann/anaconda2/bin:$PATH"
export PATH="$PATH:/Library/TeX/texbin"
export PATH="/usr/local/bin:$PATH"

# Initialize Jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"


# for automated docker scripts
export GITLAB_KEY_PATH="$HOME/.ssh/gitlab"
