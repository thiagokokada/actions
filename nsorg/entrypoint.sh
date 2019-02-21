#!/bin/bash

set -euo pipefail

# shellcheck disable=SC1091
source /lib.sh

nsorg() {
  # Ignore project.clj file since this would make lein to download project deps
  mv project.clj project.clj.bkp
  clojure -Sdeps '{:deps {leiningen {:mvn/version "2.9.0"} lein-nsorg {:mvn/version "0.2.0"}}}' \
    -m leiningen.core.main nsorg "${@}"
  mv project.clj.bkp project.clj
}

fix() {
  nsorg --replace
}

lint() {
  nsorg
}

_lint_and_fix_action nsorg "${@}"
