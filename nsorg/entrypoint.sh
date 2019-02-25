#!/bin/bash

set -euo pipefail

# shellcheck disable=SC1091
source /lib.sh
declare -a EXTRA_ARGS=()

nsorg() {
  # Ignore project.clj file since this would make lein to download project deps
  mv project.clj project.clj.bkp
  clojure -Sdeps '{:deps {leiningen {:mvn/version "2.9.0"} lein-nsorg {:mvn/version "0.3.0"}}}' \
    -m leiningen.core.main nsorg "${@}" "${EXTRA_ARGS[@]}"
  mv project.clj.bkp project.clj
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

nsorg --help
setup_extra_args ${@:2}
_lint_and_fix_action nsorg "${1}"
