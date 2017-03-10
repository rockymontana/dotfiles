alias zc="vim ~/.zshrc"
alias brewski='brew update && brew upgrade && brew upgrade brew-cask; brew cleanup; brew cask cleanup; brew doctor'
alias psysh="psysh -c ${DOTFILES}/psysh.conf"
# Laravel specific aliases
alias art="php artisan"
alias arl="php artisan route:list"
alias arc="php artisan route:clear"
alias artm="php artisan make"
alias cda="composer dump-autoload"
alias gulpack='gulp webpack && echo "Last run: " && date'
alias art="php artisan"
alias "cd.."="cd .."

alias webbish="ssh webbish"

# Tmux
alias tma='tmux attach -d -t'
alias dev7="ssh rm@172.16.6.35"

alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias zshrc="vim ~/.zshrc && reload"
alias dev="cd ~/Development/"
alias sshkey="cat ~/.ssh/id_rsa.pub |pbcopy"
