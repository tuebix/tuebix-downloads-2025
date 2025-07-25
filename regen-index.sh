#!/usr/bin/env bash

set -o errexit
set -o nounset

cd $(dirname $0)

echo -e "# Index\n" > index.md

echo -e "## Folien etc.\n" >> index.md

find -type f ! -empty -print0 | xargs -0 git ls-files -z | tr '\0' '\n' | \
  grep -vE "README.md|index.md|regen-index.sh" | \
  sed -E "s/(.*)/- [\1](\1)/" >> index.md

cat <<EOF >> index.md

EOF
