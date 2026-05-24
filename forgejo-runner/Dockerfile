FROM debian:12.14

# Install base dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    docker.io \
    git \
    gnupg \
    && rm -rf /var/lib/apt/lists/*

# Install Node.js 24 LTS from NodeSource
ENV NODE_MAJOR=24
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key \
        | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg \
    && echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_${NODE_MAJOR}.x nodistro main" \
        > /etc/apt/sources.list.d/nodesource.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends nodejs \
    && rm -rf /var/lib/apt/lists/*

# Add Adoptium repository and install OpenJDK 21 (Temurin)
RUN curl -fsSL https://packages.adoptium.net/artifactory/api/gpg/key/public \
        | gpg --dearmor -o /etc/apt/keyrings/adoptium.gpg \
    && echo "deb [signed-by=/etc/apt/keyrings/adoptium.gpg] https://packages.adoptium.net/artifactory/deb bookworm main" \
        > /etc/apt/sources.list.d/adoptium.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends temurin-21-jdk \
    && rm -rf /var/lib/apt/lists/*

# Install Go from the official release
ENV GO_VERSION=1.26.3
RUN curl -fsSL https://go.dev/dl/go${GO_VERSION}.linux-amd64.tar.gz | tar -C /usr/local -xz
ENV PATH=$PATH:/usr/local/go/bin

# Install just via the official installer
RUN curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to /usr/local/bin

# Install yarn via npm
RUN npm install -g yarn

# Gradle Installation from https://github.com/gradle/docker-gradle/blob/master/jdk21-alpine/Dockerfile

ENV GRADLE_HOME=/opt/gradle

RUN set -o errexit -o nounset \
    && echo "Adding gradle user and group" \
    && addgroup --gid 1000 gradle \
    && adduser --ingroup gradle --uid 1000 --shell /bin/bash --home /home/gradle gradle \
    && mkdir /home/gradle/.gradle \
    && chown -R gradle:gradle /home/gradle \
    && chmod -R o+rwx /home/gradle \
    \
    && echo "Symlinking root Gradle cache to gradle Gradle cache" \
    && ln -s /home/gradle/.gradle /root/.gradle

VOLUME /home/gradle/.gradle

WORKDIR /home/gradle

RUN set -o errexit -o nounset \
    && apt-get update && apt-get install -y --no-install-recommends \
      # common utilities
      make \
      curl \
      wget \
      tar \
      unzip \
      \
      # VCSes
      python3-breezy \
      python3-tzlocal \
      git \
      git-lfs \
      mercurial \
      subversion \
    && rm -rf /var/lib/apt/lists/* \
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

RUN apt-get update && apt-get install -y --no-install-recommends \
    bash \
    curl \
    git \
    git-lfs \
    unzip \
    wget \
    coreutils \
    openssh-client \
    tar \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/* \
    && mkdir -p ${ANDROID_SDK_ROOT} \
    && wget -q -O /tmp/cmdline-tools.zip https://dl.google.com/android/repository/commandlinetools-linux-${SDK_TOOLS_VERSION}_latest.zip \
    && unzip -q -K /tmp/cmdline-tools.zip -d ${ANDROID_SDK_ROOT}/cmdline-tools \
    && mv ${ANDROID_SDK_ROOT}/cmdline-tools/cmdline-tools ${ANDROID_SDK_ROOT}/cmdline-tools/${CMDLINE_VERSION} \
    && rm /tmp/cmdline-tools.zip \
    && mkdir -p ~/.android/ \
    && touch ~/.android/repositories.cfg \
    && chmod +x ${ANDROID_SDK_ROOT}/cmdline-tools/${CMDLINE_VERSION}/bin/* \
    && yes | sdkmanager --sdk_root=${ANDROID_SDK_ROOT} --licenses \
    && sdkmanager --sdk_root=${ANDROID_SDK_ROOT} --install "platform-tools" "extras;google;instantapps"

# --------------------------------------------------

# Android build-tools and platform from https://github.com/alvr/alpine-android/blob/master/docker/android.Dockerfile

ENV BUILD_TOOLS="36.0.0"
ENV TARGET_SDK="36"

ENV PATH=$PATH:${ANDROID_SDK_ROOT}/build-tools/${BUILD_TOOLS}

# Install SDK Packages
RUN sdkmanager --sdk_root="${ANDROID_SDK_ROOT}" --install "build-tools;${BUILD_TOOLS}" "platforms;android-${TARGET_SDK}" && \
    sdkmanager --sdk_root="${ANDROID_SDK_ROOT}" --uninstall emulator || true
