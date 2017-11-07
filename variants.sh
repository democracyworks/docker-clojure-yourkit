# intended to be sourced by other scripts, not run directly

declare variants=( */ )
variants=( "${variants[@]%/}" )

declare -A tags
declare -A images

for variant in "${variants[@]}"; do
    tags[$variant]=$(cat "${variant}/tag");
    images[$variant]="quay.io/democracyworks/clojure-yourkit:${tags[$variant]}"
done
