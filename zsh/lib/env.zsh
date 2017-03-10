
export PATH="${DOTFILES}/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:${HOME}/.composer/vendor/bin:$HOME/.yarn/bin:$PATH"

if [[ `uname` == 'Darwin' ]]; then
    export PATH="$(brew --prefix homebrew/php/php71)/bin:$PATH"
fi
