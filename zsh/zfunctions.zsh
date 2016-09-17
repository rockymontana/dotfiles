function tinker {
  if [[ -f artisan  ]]; then
    command php artisan tinker
  else
    command echo 'You are not running Laravel at the moment.'
    command psysh
  fi
}
