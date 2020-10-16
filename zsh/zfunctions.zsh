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