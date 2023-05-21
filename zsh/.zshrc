#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

alias vim='nvim'
alias python='python3'
alias pip='pip3'
alias g='git'
alias his='history 1 | peco'

# control+aやcontrol+eを使えるようにする
bindkey -e

# lsコマンドの色を変更
export LSCOLORS=gxfxcxdxbxegedabagacad
PROMPT='%{$fg[yellow]%}[%D{%y/%m/%f}|%D{%L:%M:%S}] '$PROMPT


# exa
if [[ $(command -v exa) ]]; then
  alias ls='exa --icons --git'
  alias la='exa -a --icons --git'
  alias ll='exa -aal --icons --git'
fi

# pyenv https://github.com/pyenv/pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# mysql@5.7
export PATH="/opt/homebrew/opt/mysql@5.7/bin:$PATH"

# ghq peco
## ghqとの連携。ghqの管理化にあるリポジトリを一覧表示する。ctrl - ]にバインド。
function peco-src () {
  local selected_dir=$(ghq list -p | peco --prompt="repositories >" --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src

# apikey.shの読み込み
source "$HOME/apikey.sh"

