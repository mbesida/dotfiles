# If you come from bash you might have to change your $PATH.
if [[ "$PATH" != *"$HOME/bin:/usr/local/bin"* ]] ; then
    export PATH=$HOME/bin:/usr/local/bin:$PATH
fi

if [[ -d "$HOME/.local/bin" && "$PATH" != *"$HOME/.local/bin"* ]] ; then
  export PATH=$HOME/.local/bin:$PATH
fi

# Path to your oh-my-zsh installation.
export ZSH="/home/$USER/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="intheloop"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=5

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
   git
   zsh-autosuggestions 
   zsh-syntax-highlighting
   timer
   extract
   dirhistory
)

if [ -e "/usr/share/zsh/vendor-completions/_docker" ] ; then
  plugins+=(docker docker-compose)
fi

if [[ $(command -v kubectl > /dev/null; echo $?) -eq 0 ]] ; then
  plugins+=(kubectl)
fi

if [[ $(command -v helm > /dev/null; echo $?) -eq 0 ]] ; then
  plugins+=(helm)
fi

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

### aliases
alias zshrc="nano ~/.zshrc"
alias re-source="source ~/.zshrc"
alias python="python3"
alias ipp='curl https://ipecho.net/plain; echo'
alias sizeof='du -hd 1'
alias update='sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y'
alias n='nano'

#if in wsl
if [ -d "/mnt/c/Users/$USER" ] ; then
    export winhome="/mnt/c/Users/$USER"
    alias winhome="cd $winhome"
fi

if [ $(command -v direnv) ] ; then
  alias di="touch .envrc && direnv allow"
fi

if [ $(command -v lsd) ] ; then
  alias l="lsd -l"
  alias ll="lsd -lAh"
fi

if [ $(command -v json_pp) ] ; then
  alias jsonpp='json_pp'
fi

if [[ $(command -v trash) && $(command -v python3) ]] ; then
  export TRASH="~/.local/share/Trash"
  alias rm="echo 'Moving files/dirs to $TRASH';trash"
fi
### end aliases

###ssh-agent stuff
env=~/.ssh/agent.env

agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }

agent_start () {
    (umask 077; ssh-agent >| "$env")
    . "$env" >| /dev/null ; }

agent_load_env

# agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2= agent not running
agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
    agent_start
    ssh-add
elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
    ssh-add
fi

unset env
###ssh-agent stuf

if [ $(command -v direnv) ] ; then
  eval "$(direnv hook zsh)"
fi

if [ $(command -v fzf) ] ; then
  source /usr/share/doc/fzf/examples/key-bindings.zsh
fi


if [[ -d "$HOME/.serverless" && "$PATH" != *"$HOME/.serverless/bin"* ]] ; then
  # Added by serverless binary installer
  export PATH="$HOME/.serverless/bin:$PATH"
fi

if [ -d "$HOME/.nvm" ] ; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completio
fi

if [[ -d "$HOME/.istioctl" && "$PATH" != *"$HOME/.istioctl/bin"* ]] ; then
  export PATH=$PATH:$HOME/.istioctl/bin
fi

if [[ -d "$HOME/.local/share/coursier/bin" && "$PATH" != *"$HOME/.local/share/coursier/bin"* ]] ; then
  export PATH=$PATH:$HOME/.local/share/coursier/bin
fi

if [[ -d "$HOME/.goenv" ]] ; then
  local currentGoRoot=$GOROOT
  local currentGoPath=$GOPATH

  export GOENV_ROOT="$HOME/.goenv"

  if [[ "$PATH" != *"$HOME/.goenv/bin"* ]] ; then
    export PATH="$GOENV_ROOT/bin:$PATH"
  fi

  eval "$(goenv init -)"

  if [ -z "$currentGoRoot" ]; then
    export PATH="$GOROOT/bin:$PATH"
  elif [[ "$currentGoRoot" != "$GOROOT" ]] ; then 
    export PATH=$(echo "$PATH" | sed "s|$currentGoRoot|$GOROOT|g")
  fi

  if [ -z "$currentGoPath" ]; then
    export PATH="$PATH:$GOPATH/bin"
  elif [[ "$currentGoPath" != "$GOPATH" ]] ; then 
    export PATH=$(echo "$PATH" | sed "s|$currentGoPath|$GOPATH|g")
  fi
fi

# >>> scala-cli completions and aliases >>>
if [ $(command -v scala-cli) ] ; then
  fpath=("/home/$USER/.local/share/scalacli/completions/zsh" $fpath)
  compinit
  alias sc="scala-cli"
fi
# <<< scala-cli completions aliases <<<

# added by Nix installer
if [ -e /home/mbesida/.nix-profile/etc/profile.d/nix.sh ]; then . /home/mbesida/.nix-profile/etc/profile.d/nix.sh; fi 

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/$USER/.sdkman"
[[ -s "/home/$USER/.sdkman/bin/sdkman-init.sh" ]] && source "/home/$USER/.sdkman/bin/sdkman-init.sh"
