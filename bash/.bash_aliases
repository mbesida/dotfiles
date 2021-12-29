alias ll="ls -la"
alias python="python3"
alias ipp='curl https://ipecho.net/plain; echo'
alias sizeof='du -hd 1'
alias update='sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y'
alias n='nano'

#if in wsl
if [ -d "/mnt/c/Users/$USER" ] ; then
    export winhome="/mnt/c/Users/$USER"
fi

if [ $(command -v direnv) ] ; then
  alias di="touch .envrc && direnv allow"
fi

if [ $(command -v lsd) ] ; then
  alias l="lsd -lAh"
fi

if [ $(command -v json_pp) ] ; then
  alias jsonpp='json_pp'
fi