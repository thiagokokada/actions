#!/bin/bash

set -euo pipefail

# shellcheck disable=SC1091
source /lib.sh
declare -a EXTRA_ARGS=()

nsorg() {
  clojure -Sdeps '{:deps {nsorg-cli {:mvn/version "0.3.1"}}}' \
    -m nsorg.cli "${@}" "${EXTRA_ARGS[@]}"
}

fix() {
  nsorg --replace
}

lint() {
  nsorg
}

setup_extra_args() {
  for extra_arg in "${@}"; do
    EXTRA_ARGS+=("${extra_arg}")
  done
}

setup_extra_args ${@:2}
_lint_and_fix_action nsorg "${1}"
