alias ll="ls -la"
alias python="python3"
alias ipp='curl https://ipecho.net/plain; echo'
alias sizeof='du -hd 1'
alias update='sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y'
alias n='nano'
alias jsonpp='json_pp'

if [ $(command -v direnv) ] ; then
  alias di="echo dotenv > .envrc && touch .env && direnv allow"
fi
