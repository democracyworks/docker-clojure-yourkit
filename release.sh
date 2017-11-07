#!/usr/bin/env bash
set -e

if [[ -n $(git status -s) ]]; then
    echo "Git working tree must be clean for release."
    exit 1
fi

./build.sh

source ./variants.sh

for image in "${images[@]}"; do
    docker push ${image}
done
