# clojure-yourkit

Docker images with Clojure and YourKit.

## Using these Dockerfiles

These Docker images are based on the Debian versions
of [official Clojure images][clojure images], `lein` and
`boot`. Usuage is essentially the same, but these expose port 10000
for the YourKit agent, and inject the environment variables
`YOURKIT_AGENT_PATH`, `YOURKIT_AGENT_PORT`, and `YOURKIT_AGENT_OPTION`
for use in your container.

For example:

```
FROM quay.io/democracyworks/clojure-yourkit:lein-2.7.1

COPY . /project
WORKDIR /project
RUN lein uberjar

CMD java $YOURKIT_AGENT_OPTION -jar target/project.jar
```

[clojure images]: https://hub.docker.com/_/clojure/

## Builds

Dockerfiles are generated from the `Dockerfile.template` by the
`update.sh` script.

If you want to modify them, edit the template and/or the appropriate
tag file, then run `./update.sh`.

## YourKit

The YourKit agent is goverend by license-redist.txt.
