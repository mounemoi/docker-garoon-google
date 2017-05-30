FROM java:8-alpine
ENV container docker

RUN \
    apk add --no-cache --virtual .build git bash && \
    apk add --no-cache libstdc++ && \
    git clone https://github.com/cybozu/garoon-google.git && \
    cd garoon-google && \
    ./gradlew clean build copy && \
    apk del .build

VOLUME [ "/config" ]
CMD [ "java", "-jar", "/garoon-google/GGsync.jar", "/config/" ]

