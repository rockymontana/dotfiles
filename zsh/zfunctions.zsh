function tinker {
  if [[ -f artisan  ]]; then
    command php artisan tinker
  else
    command echo 'You are not running Laravel at the moment.'
    command psysh
  fi
}
function composer-link() {
    composer config repositories.local '{"type": "path", "url": "'$1'"}' --file composer.json
}

function cosh () {
    git add -A;
    git commit -m "$@";
    git pull;
    git push;
}

#compdef openapi
###-begin-openapi-completions-###
#
# yargs command completion script
#
# Installation: openapi completion >> ~/.zshrc
#    or openapi completion >> ~/.zsh_profile on OSX.
#
_openapi_yargs_completions()
{
  local reply
  local si=$IFS
  IFS=$'
' reply=($(COMP_CWORD="$((CURRENT-1))" COMP_LINE="$BUFFER" COMP_POINT="$CURSOR" openapi --get-yargs-completions "${words[@]}"))
  IFS=$si
  _describe 'values' reply
}
compdef _openapi_yargs_completions openapi
###-end-openapi-completions-###

