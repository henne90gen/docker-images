FROM alpine:3.23.4

# Install Node.js, Docker CLI, Go and OpenJDK 21
RUN apk add --no-cache \
    ca-certificates \
    curl \
    docker-cli \
    nodejs \
    npm \
    yarn \
    go \
    openjdk21 \
    git \
    just

# Gradle Installation from https://github.com/gradle/docker-gradle/blob/master/jdk21-alpine/Dockerfile

ENV GRADLE_HOME=/opt/gradle

RUN set -o errexit -o nounset \
    && echo "Adding gradle user and group" \
    && addgroup --system --gid 1000 gradle \
    && adduser --system --ingroup gradle --uid 1000 --shell /bin/ash gradle \
    && mkdir /home/gradle/.gradle \
    && chown -R gradle:gradle /home/gradle \
    && chmod -R o+rwx /home/gradle \
    \
    && echo "Symlinking root Gradle cache to gradle Gradle cache" \
    && ln -s /home/gradle/.gradle /root/.gradle

VOLUME /home/gradle/.gradle

WORKDIR /home/gradle

RUN set -o errexit -o nounset \
    && apk add --no-cache \
      # common utilities
      make \
      curl \
      wget \
      tar \
      \
      # VCSes
      breezy \
      py3-tzlocal \
      git \
      git-lfs \
      mercurial \
      subversion \
    \
    && echo "Testing common utilities" \
    && which awk \
    && which curl \
    && which cut \
    && which grep \
    && which gunzip \
    && which sha256sum \
    && which sed \
    && which tar \
    && which tr \
    && which unzip \
    && which wget \
    \
    && echo "Testing VCSes" \
    && which git \
    && which git-lfs \
    && which hg \
    && which svn

ENV GRADLE_VERSION=9.5.1
ARG GRADLE_DOWNLOAD_SHA256=bafc141b619ad6350fd975fc903156dd5c151998cc8b058e8c1044ab5f7b031f
RUN set -o errexit -o nounset \
    && echo "Downloading Gradle" \
    && wget --no-verbose --output-document=gradle.zip "https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip" \
    \
    && echo "Checking Gradle download hash" \
    && echo "${GRADLE_DOWNLOAD_SHA256} *gradle.zip" | sha256sum -c - \
    \
    && echo "Installing Gradle" \
    && unzip gradle.zip \
    && rm gradle.zip \
    && mv "gradle-${GRADLE_VERSION}" "${GRADLE_HOME}/" \
    && ln -s "${GRADLE_HOME}/bin/gradle" /usr/bin/gradle

USER gradle

RUN set -o errexit -o nounset \
    && echo "Testing Gradle installation" \
    && gradle --stacktrace --debug --version

USER root

# --------------------------------------------------

# Android SDK Installation from https://github.com/alvr/alpine-android/blob/master/docker/base.Dockerfile

ENV CMDLINE_VERSION="20.0"
ENV SDK_TOOLS_VERSION="14742923"

ENV ANDROID_SDK_ROOT="/opt/sdk"
ENV ANDROID_HOME=${ANDROID_SDK_ROOT}
ENV PATH=$PATH:${ANDROID_SDK_ROOT}/cmdline-tools/${CMDLINE_VERSION}/bin:${ANDROID_SDK_ROOT}/platform-tools:${ANDROID_SDK_ROOT}/extras/google/instantapps

RUN apk upgrade && \
    apk add --no-cache bash curl git git-lfs unzip wget coreutils openssh-client tar && \
    rm -rf /tmp/* && \
    rm -rf /var/cache/apk/* && \
    mkdir -p ${ANDROID_SDK_ROOT} && \
    busybox unzip <(wget -qO- https://dl.google.com/android/repository/commandlinetools-linux-${SDK_TOOLS_VERSION}_latest.zip) -qK -d ${ANDROID_SDK_ROOT}/cmdline-tools && \
    mv ${ANDROID_SDK_ROOT}/cmdline-tools/* ${ANDROID_SDK_ROOT}/cmdline-tools/${CMDLINE_VERSION} && \
    mkdir -p ~/.android/ && \
    touch ~/.android/repositories.cfg && \
    chmod +x ${ANDROID_SDK_ROOT}/cmdline-tools/${CMDLINE_VERSION}/bin/* && \
    yes | sdkmanager --sdk_root=${ANDROID_SDK_ROOT} --licenses && \
    sdkmanager --sdk_root=${ANDROID_SDK_ROOT} --install "platform-tools" "extras;google;instantapps"

# --------------------------------------------------

# Android build-tools and platform from https://github.com/alvr/alpine-android/blob/master/docker/android.Dockerfile

ENV BUILD_TOOLS="35.0.1"
ENV TARGET_SDK="35"

ENV PATH=$PATH:${ANDROID_SDK_ROOT}/build-tools/${BUILD_TOOLS}

# Install SDK Packages
RUN sdkmanager --sdk_root="${ANDROID_SDK_ROOT}" --install "build-tools;${BUILD_TOOLS}" "platforms;android-${TARGET_SDK}" && \
    sdkmanager --sdk_root="${ANDROID_SDK_ROOT}" --uninstall emulator || true
