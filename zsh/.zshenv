# conatins mostly PATH modifications which should occur only once per session
# add here only if some installation reqires explitly to edit PATH variable

export PATH=$HOME/bin:/usr/local/bin:$PATH

if [[ -d "$HOME/.local/bin" ]] ; then
  export PATH=$HOME/.local/bin:$PATH
fi

if [[ -d "$HOME/.serverless" ]] ; then
  # Added by serverless binary installer
  export PATH="$HOME/.serverless/bin:$PATH"
fi

if [[ -d "$HOME/.istioctl" ]] ; then
  export PATH=$PATH:$HOME/.istioctl/bin
fi

if [[ -d "$HOME/.local/share/coursier/bin" ]] ; then
  export PATH=$PATH:$HOME/.local/share/coursier/bin
fi

if [[ -d "$HOME/.goenv" ]] ; then
  export GOENV_ROOT="$HOME/.goenv"
  export PATH="$GOENV_ROOT/bin:$PATH"

  eval "$(goenv init -)"

  export PATH="$GOROOT/bin:$PATH"
  export PATH="$PATH:$GOPATH/bin"
fi

if [[ -d "$HOME/.cargo/bin" ]] ; then
  export PATH=$PATH:$HOME/.cargo/bin
fi