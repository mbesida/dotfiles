alias ll="ls -la"
alias l="ls -l"
alias python="python3"
alias ipp='curl https://ipecho.net/plain; echo'
alias sizeof='du -hd 1'
alias update='sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y'
alias n='nano'
alias jsonpp='json_pp'

#if in wsl
if [ -d "/mnt/c/Users/$USER" ] ; then
    export winhome="/mnt/c/Users/$USER"
fi

if [ $(command -v direnv) ] ; then
  alias di="echo dotenv > .envrc && touch .env && direnv allow"
fi

if [ $(command -v docker) ] ; then
  alias d="docker"
  alias d-rm="docker ps -a | awk '{if (\$1 != \"CONTAINER\") print \$1}' | xargs -L1 docker rm -f"
fi
