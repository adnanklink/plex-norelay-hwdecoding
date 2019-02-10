# arg
ARG BRANCH
ARG COMMIT
ARG TAG

# image
FROM plexinc/pms-docker:${TAG:-latest}

# env
ENV NVIDIA_DRIVER_CAPABILITIES="compute,video,utility"
ENV NVIDIA_VISIBLE_DEVICES="all"

# output
RUN \
  echo "** BRANCH: ${BRANCH:-Unknown} - COMMIT: ${COMMIT:-Unknown} - TAG: ${TAG:-Unknown} **"

# add script to remove plex relay
COPY root/ /

# ports and volumes
EXPOSE 32400 32400/udp 32469 32469/udp 5353/udp 1900/udp
VOLUME /config /transcode
