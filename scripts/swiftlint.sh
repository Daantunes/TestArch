#!/bin/bash

set -eu

# If you're on an M1 Mac, need this too...
export PATH="/opt/homebrew/bin/:$PATH"

unset SDKROOT

if mint list | grep -q 'SwiftLint'; then
    mint run swiftlint --config ./.swiftlint.yml
fi
