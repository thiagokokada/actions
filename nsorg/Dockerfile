FROM clojure:tools-deps-alpine

LABEL "com.github.actions.name"="nsorg"
LABEL "com.github.actions.description"="Organize ns form for Clojure files"
LABEL "com.github.actions.icon"="user-check"
LABEL "com.github.actions.color"="purple"

LABEL "repository"="http://github.com/thiagokokada/actions"
LABEL "homepage"="http://github.com/thiagokokada/actions"
LABEL "maintainer"="Thiago Kenji Okada <thiagokokada@gmail.com>"

RUN clojure -Sdeps '{:deps {nsorg-cli {:mvn/version "0.3.1"}}}' -e ":ok"

RUN apk --no-cache add \
  curl~=7 \
  jq~=1.6 \
  bash~=4 \
  git~=2

COPY lib.sh /lib.sh
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
