#!/bin/bash

set -euo pipefail

# shellcheck disable=SC1091
source /lib.sh

nsorg() {
  clojure -Sdeps '{:deps {leiningen {:mvn/version "2.9.0"} lein-nsorg {:mvn/version "0.2.0"}}}' \
    -m leiningen.core.main nsorg "${@}"
}

fix() {
  nsorg --replace
}

lint() {
  nsorg
}

_lint_and_fix_action nsorg "${@}"
