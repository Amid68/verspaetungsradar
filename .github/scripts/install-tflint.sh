#!/bin/sh
set -e
base=https://github.com/terraform-linters/tflint/releases/download/v${TFLINT_VERSION}
curl -sSfLO "$base/tflint_linux_amd64.zip"
curl -sSfL "$base/checksums.txt" | grep tflint_linux_amd64.zip | sha256sum -c
unzip tflint_linux_amd64.zip
sudo install tflint /usr/local/bin/
