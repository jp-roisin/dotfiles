export ZSH="$HOME/.oh-my-zsh"

# Fix warning: https://github.com/withfig/fig/issues/2484
export LC_ALL="en_US.UTF-8"

ZSH_THEME="gozilla"

# Colorize setup
ZSH_COLORIZE_TOOL=chroma
ZSH_COLORIZE_STYLE="colorful"

plugins=(git tmux alias-tips autojump yarn brew zsh-cargo-completion zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

alias vim="nvim"
alias vi="nvim"
alias lg="lazygit"

alias libreoffice='open -a "LibreOffice"'

alias tsm="transmission-remote"

alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export LDFLAGS="-L/opt/homebrew/opt/mysql@8.0/lib"
export CPPFLAGS="-I/opt/homebrew/opt/mysql@8.0/include"

export LDFLAGS="-L/opt/homebrew/opt/openssl@1.1/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@1.1/include"

export PATH="/opt/homebrew/opt/openssl@1.1/bin:$PATH"

# bun completions
[ -s "/Users/jproisin/.bun/_bun" ] && source "/Users/jproisin/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# go
export GOPATH="$HOME/go"
PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# Tmux
export TMUX_CONF="$HOME/.config/tmux/.tmux.conf"

# AppTweak stuff
eval "$(rbenv init - zsh)"

source "$HOME/.asdf/asdf.sh"
