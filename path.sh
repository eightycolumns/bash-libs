source "${HOME}/lib/util.sh"

remove_from_path() {
  (($# == 1)) || error 'remove_from_path() expects one argument'
  local -r dir=$1

  PATH=:${PATH}:
  PATH=${PATH//:${dir}:/:}
  PATH=$(echo "${PATH}" | sed -r 's/(^:|:$)//g')
}

export -f remove_from_path

append_to_path() {
  (($# == 1)) || error 'append_to_path() expects one argument'
  local -r dir=$1

  remove_from_path "${dir}"
  PATH=${PATH}:${dir}
}

export -f append_to_path

prepend_to_path() {
  (($# == 1)) || error 'prepend_to_path() expects one argument'
  local -r dir=$1

  remove_from_path "${dir}"
  PATH=${dir}:${PATH}
}

export -f prepend_to_path
