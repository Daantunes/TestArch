#!/bin/bash

set -eu

# If you're on an M1 Mac, need this too...
export PATH="/opt/homebrew/bin/:$PATH"

unset SDKROOT

if mint list | grep -q 'SwiftFormat'; then
    
    FILES=${1:-./}
    mint run swiftformat --config ./.swiftformat $FILES
fi
