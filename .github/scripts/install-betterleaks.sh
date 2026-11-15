#!/bin/sh
set -e
base=https://github.com/betterleaks/betterleaks/releases/download/v${BETTERLEAKS_VERSION}
file=betterleaks_${BETTERLEAKS_VERSION}_linux_x64.tar.gz
curl -sSfLO "$base/$file"
curl -sSfL "$base/checksums.txt" | grep "$file" | sha256sum -c
tar xzf "$file" betterleaks
sudo install betterleaks /usr/local/bin/
