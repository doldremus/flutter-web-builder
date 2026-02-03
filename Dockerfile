FROM dart:stable

RUN apt-get update && apt-get install -y --no-install-recommends \
    git unzip curl libglu1-mesa ca-certificates \
    && rm -rf /var/lib/apt/lists/*

ARG FLUTTER_SDK_VERSION=3.38.9
RUN git clone --depth 1 --branch ${FLUTTER_SDK_VERSION} https://github.com/flutter/flutter /opt/flutter

ENV PATH="/opt/flutter/bin:/opt/flutter/bin/cache/dart-sdk/bin:${PATH}"

RUN flutter config --no-analytics --enable-web && \
    flutter precache --web

RUN flutter doctor
