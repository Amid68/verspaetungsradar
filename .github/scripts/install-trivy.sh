#!/bin/sh
set -e
base=https://github.com/aquasecurity/trivy/releases/download/v${TRIVY_VERSION}
file=trivy_${TRIVY_VERSION}_Linux-64bit.tar.gz
curl -sSfLO "$base/$file"
curl -sSfL "$base/trivy_${TRIVY_VERSION}_checksums.txt" | grep "$file" | sha256sum -c
tar xzf "$file" trivy
sudo install trivy /usr/local/bin/
