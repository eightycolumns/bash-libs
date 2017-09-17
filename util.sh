error() {
  (($# == 1)) || error 'error() expects one argument'
  local -r message=$1

  echo "error: ${message}" 1>&2 && exit 1
}

export -f error

usage() {
  (($# == 1)) || error 'usage() expects one argument'
  local -r message=$1

  echo "usage: ${message}" 1>&2 && exit 64
}

export -f usage
