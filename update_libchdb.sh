#!/bin/bash

STATIC=false

# Parse arguments
while [ "$#" -gt 0 ]; do
  case "$1" in
    --static)
      STATIC=true
      ;;
    --) # end of options
      shift
      break
      ;;
    -*)
      echo "Unknown option: $1" >&2
      exit 1
      ;;
    *)
      # Positional argument or unrecognized
      echo "Ignoring positional argument: $1"
      ;;
  esac
  shift
done

# Get the newest release version
LATEST_RELEASE=$(curl --silent "https://api.github.com/repos/chdb-io/chdb/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')

# Download the correct version based on the platform
case "$(uname -s)" in
    Linux)
        if [[ $(uname -m) == "aarch64" ]]; then
            if  [ "$STATIC" = true ]; then
                PLATFORM="linux-aarch64-libchdb-static.tar.gz"
            else
                PLATFORM="linux-aarch64-libchdb.tar.gz"
            fi
        else
            if  [ "$STATIC" = true ]; then
                PLATFORM="linux-x86_64-libchdb-static.tar.gz"
            else
                PLATFORM="linux-x86_64-libchdb.tar.gz"
            fi
        fi
        ;;
    Darwin)
        if [[ $(uname -m) == "arm64" ]]; then
            if  [ "$STATIC" = true ]; then
                PLATFORM="macos-arm64-libchdb-static.tar.gz"
            else
                PLATFORM="macos-arm64-libchdb.tar.gz"
            fi
        else
            if  [ "$STATIC" = true ]; then
                PLATFORM="macos-x86_64-libchdb-static.tar.gz"
            else
                PLATFORM="macos-x86_64-libchdb.tar.gz"
            fi
        fi
        ;;
    *)
        echo "Unsupported platform"
        exit 1
        ;;
esac

DOWNLOAD_URL="https://github.com/chdb-io/chdb/releases/download/$LATEST_RELEASE/$PLATFORM"

echo "Downloading $PLATFORM from $DOWNLOAD_URL"

# Download the file
curl -L -o libchdb.tar.gz $DOWNLOAD_URL

# Untar the file
tar -xzf libchdb.tar.gz

mv chdb.h ./lib_files/chdb.h
if  [ "$STATIC" = true ]; then
    # Set execute permission for libchdb.so/libchdb.a
    chmod +x libchdb.a

    # move header to the lib
    mv libchdb.a ./lib_files
else
    # Set execute permission for libchdb.so/libchdb.a
    chmod +x libchdb.so

    # move header to the lib
    mv libchdb.so ./lib_files
fi

# Clean up
rm -f libchdb.tar.gz
rm -f chdb.hpp
