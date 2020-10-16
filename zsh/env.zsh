export COMPOSER_HOME="${HOME}/.composer"
export PHP_CS_FIXER_IGNORE_ENV=1
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:${DOTFILES}/bin:$HOME/.yarn/bin:${COMPOSER_HOME}/vendor/bin:$PATH"
export PATH="node_modules/.bin:$PATH"

ulimit -n 65536
ulimit -u 2048

setopt clobber

export LC_COLLATE=en_US.UTF-8
export LC_CTYPE=UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_NUMERIC=sv_SE.UTF-8
export LC_TIME=sv_SE.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8


git config --global core.excludesfile ~/.dotfiles/conf/gitignore
