#!/usr/bin/env bash
set -e

./update.sh

source ./variants.sh

for variant in "${variants[@]}"; do
    image=${images[$variant]}
    echo "Building ${image}"

    docker build -t $image "${variant}/"
done
