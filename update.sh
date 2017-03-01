#!/usr/bin/env bash
set -e
shopt -s nullglob

declare variants=( */ )
variants=( "${variants[@]%/}" )

for variant in "${variants[@]}"; do
    tag=$(cat "${variant}/tag");

    cp Dockerfile.template "${variant}/Dockerfile"

    sed -i "" "s/%%TAG%%/$tag/g" "${variant}/Dockerfile"

    cp libyjpagent.so "${variant}/"
    cp license-redist.txt "${variant}/"
done
