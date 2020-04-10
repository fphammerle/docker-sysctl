FROM alpine:3.11

ARG PROCPS_PACKAGE_VERSION=3.3.16-r0
ARG DEBUG_TOOLS="\
    curl \
    iproute2 \
    iptables \
    netcat-openbsd \
    "
RUN apk add --no-cache \
    procps=$PROCPS_PACKAGE_VERSION \
    tini \
    $DEBUG_TOOLS

ENV SYSCTL_ARGS=
ENV SLEEP_INTERVAL=infinite

ENTRYPOINT ["tini", "--"]
CMD sysctl $SYSCTL_ARGS && sleep $SLEEP_INTERVAL
