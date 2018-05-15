# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="tessa"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# export DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(golang lol compleat history httpie scd aws redis-cli wd jsontools \
    fasd docker colored-man-pages zsh-navigation-tools colorize extract \
    python git ruby gem vi-mode zsh-syntax-highlighting mvn thanh)
if uname | grep Darwin >> /dev/null; then
    plugins+=(osx brew)
elif uname | grep Linux >> /dev/null; then
    plugins+=(copydir copybuffer)
fi

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
#export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/texbin:/usr/X11/bin

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

