alias zc="vim ~/.zshrc"
alias zcr="vim ~/.zshrc && reload"

alias brewski='brew update && brew upgrade && brew upgrade brew-cask; brew cleanup; brew cask cleanup; brew doctor'
alias "cd.."="cd .."

# PHP
alias psysh="psysh -c ${DOTFILES}/conf/psysh.conf"
alias cda="composer dump-autoload"

# Laravel specific aliases
alias art="php artisan"
alias arl="php artisan route:list"
alias arc="php artisan route:clear"

# Git
alias gs="git status"
alias stash="git stash"
alias nah="git reset --hard HEAD"

# Tmux
alias tma='tmux attach -d -t'

alias reload="source ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias dev="cd ~/Development/"
alias sshkey="cat ~/.ssh/id_rsa.pub |pbcopy"
alias sited="cd ~/Development/SiteDirect"
alias swocs="composer make-docs && cat public/docs/swagger.json |pbcopy"
alias valias="vim ~/.dotfiles/zsh/alias.zsh"
