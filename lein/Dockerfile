FROM clojure:lein-2.7.1
MAINTAINER Christopher Shea <chris@democracy.works>

ADD libyjpagent.so /opt/yourkit/libyjpagent.so
ADD license-redist.txt /opt/yourkit/license-redist.txt

ENV YOURKIT_AGENT_PATH /opt/yourkit/libyjpagent.so
ENV YOURKIT_AGENT_PORT 10000
ENV YOURKIT_AGENT_OPTION -agentpath:/opt/yourkit/libyjpagent.so=port=10000

EXPOSE 10000
