alias zc="vim ~/.zshrc"
alias zcr="vim ~/.zshrc && reload"
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy";

alias brewski='brew update && brew upgrade && brew upgrade brew-cask; brew cleanup; brew doctor'
alias "cd.."="cd .."

# PHP
alias psysh="psysh -c ${DOTFILES}/conf/psysh.conf"
alias cda="composer dump-autoload"

# Laravel specific aliases
alias pf="phpunit --filter "
alias art="php artisan"
alias migrate="php artisan migrate"
alias arl="php artisan route:list"
alias arc="php artisan route:clear"

# Node
alias nrw="npm run watch"
alias nrd="npm run dev"
alias nrp="npm run production"

# Git
alias status="git status"
alias stash="git stash"
alias nah="git reset --hard && git clean -df"
alias pull="git pull"
alias push="git push"
alias merge="git merge $1"
alias checkout="git checkout $1"
alias gs="git status"
alias commit="git commit -m $1"
# Tmux
alias tma='tmux attach -d -t'

alias reload="source ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias dev="cd ~/code/"
alias sshkey="cat ~/.ssh/id_rsa.pub |pbcopy"
alias valias="vim ~/.dotfiles/zsh/alias.zsh && reload"

alias pu="./vendor/bin/phpunit"
alias puf="./vendor/bin/phpunit --filter $1"

# Docker
alias dr="docker-compose down && docker-compose up -d --build"


# Unalias
if alias cp 2>/dev/null; then
  unalias cp
fi
