FROM debian:trixie

ENV DEBIAN_FRONTEND=noninteractive

# Install base dependencies
RUN apt-get update && apt-get install -y \
    wget vim \
    curl ldc dub \
    gnupg \
    ca-certificates \
    build-essential \
    zlib1g-dev \
    libssl-dev \
    pkg-config \
    git \
    default-jre-headless \
    openssh-server \
    lsb-release \
    xz-utils \
    && rm -rf /var/lib/apt/lists/*

# Expose the target architecture variable
ARG TARGETARCH

# Base URL for downloads
ARG COMMON_URL="https://github.com/ClickHouse/ClickHouse/releases/download/v25.5.2.47-stable/clickhouse-common-static_25.5.2.47"
#ARG CLIENT_URL="https://github.com/ClickHouse/ClickHouse/releases/download/v25.5.2.47-stable/clickhouse-client_25.5.2.47"
#ARG SERVER_URL="https://github.com/ClickHouse/ClickHouse/releases/download/v25.5.2.47-stable/clickhouse-server_25.5.2.47"
ARG BRIDGE_URL="https://packages.clickhouse.com/deb/pool/main/c/clickhouse/clickhouse-library-bridge_25.1.5.31"

# Create clickhouse user and install specific ClickHouse version
RUN useradd -m clickhouse && \
    mkdir -p /opt/clickhouse && \
    cd /opt/clickhouse && \
    set -eux; \
    if [ "$TARGETARCH" = "amd64" ]; then \
        ARCH_SUFFIX="_amd64"; \
    elif [ "$TARGETARCH" = "arm64" ] || [ "$TARGETARCH" = "aarch64" ]; then \
        ARCH_SUFFIX="_arm64"; \
    else \
        echo "Unsupported architecture: $TARGETARCH"; \
        exit 1; \
    fi; \
    COMMON_FULL_URL="${COMMON_URL}${ARCH_SUFFIX}.deb"; \
    #CLIENT_FULL_URL="${CLIENT_URL}${ARCH_SUFFIX}.deb"; \
    #SERVER_FULL_URL="${SERVER_URL}${ARCH_SUFFIX}.deb"; \
    BRIDGE_FULL_URL="${BRIDGE_URL}${ARCH_SUFFIX}.deb"; \
    wget "${COMMON_FULL_URL}" && \
    #wget "${CLIENT_FULL_URL}" && \
    #wget "${SERVER_FULL_URL}" && \
    wget "${BRIDGE_FULL_URL}" && \
    dpkg -i *.deb && \
    rm *.deb

# Set working directory
WORKDIR /app
COPY . /app

# Update chdb and install library
RUN chmod a+x update_libchdb.sh && \
    ./update_libchdb.sh

RUN clickhouse-library-bridge --http-port=9019 &
