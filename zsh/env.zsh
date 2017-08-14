export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:${DOTFILES}/bin:$HOME/.yarn/bin:${COMPOSER_HOME}/vendor/bin:$PATH"

if [[ `uname` == 'Darwin' ]]; then
    export PATH="$PATH:$(brew --prefix homebrew/php/php71)/bin"
fi
export LANG=en_US.UTF-8
export LC_COLLATE=en_US.UTF-8
export LC_CTYPE=UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_NUMERIC=sv_SE.UTF-8
export LC_TIME=sv_SE.UTF-8