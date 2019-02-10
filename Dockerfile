# image
ARG TAG=latest
FROM plexinc/pms-docker:${TAG}

# arg (args before FROM must be declared again: https://docs.docker.com/engine/reference/builder/#understand-how-arg-and-from-interact)
ARG BRANCH
ARG COMMIT
ARG TAG

# env
ENV \
	BRANCH=${BRANCH:-Unknown} \
	COMMIT=${COMMIT:-Unknown} \
	TAG=${TAG:-Unknown} \
	NVIDIA_DRIVER_CAPABILITIES="compute,video,utility" \
	NVIDIA_VISIBLE_DEVICES="all"
	

# output
RUN \
  echo "** BRANCH: ${BRANCH} - COMMIT: ${COMMIT} - TAG: ${TAG} **"

# add script to remove plex relay
COPY root/ /

# ports and volumes
EXPOSE 32400 32400/udp 32469 32469/udp 5353/udp 1900/udp
VOLUME /config /transcode
