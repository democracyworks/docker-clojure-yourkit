#!/usr/bin/env bash
set -e

if [[ -n $(git status -s) ]]; then
    echo "Git working tree must be clean for release."
    exit 1
fi

./update.sh

declare variants=( */ )
variants=( "${variants[@]%/}" )

for variant in "${variants[@]}"; do
    tag=$(cat "${variant}/tag");
    image="quay.io/democracyworks/clojure-yourkit:${tag}"

    echo "Building ${image}"

    docker build -t $image "${variant}/"

    docker push ${image}
done
