export COMPOSER_HOME="${HOME}/.composer"
export PHP_CS_FIXER_IGNORE_ENV=1
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:${DOTFILES}/bin:$HOME/.yarn/bin:${COMPOSER_HOME}/vendor/bin:$PATH"
export PATH="/usr/local/opt/php@7.2/bin:$PATH"

#if [[ `uname` == 'Darwin' ]]; then
#    export PATH="$PATH:$(brew --prefix homebrew/php/php71)/bin"
#fi
export LC_COLLATE=en_US.UTF-8
export LC_CTYPE=UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_NUMERIC=sv_SE.UTF-8
export LC_TIME=sv_SE.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
