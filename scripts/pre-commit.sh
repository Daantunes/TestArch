#!/bin/bash
# Documentation: https://git-scm.com/docs/githooks.html#_pre_commit

set -eu

# Format source code
STAGED_SWIFT_FILES=$(git_staged_files_with_extension "swift")
if [ -n "$STAGED_SWIFT_FILES" ]; then
    PRE_FORMAT_HASH=$(echo "$STAGED_SWIFT_FILES" | xargs git --no-pager diff | md5)

    sh scripts/swiftformat.sh "$(echo "$STAGED_SWIFT_FILES" | tr ' ' ,)"

    POST_FORMAT_HASH=$(echo "$STAGED_SWIFT_FILES" | xargs git --no-pager diff | md5)

    if [ "$PRE_FORMAT_HASH" != "$POST_FORMAT_HASH" ]
    then
        MESSAGES+="⚠️  Staged source code files modified during commit"
    fi
fi

# Show info message
if [ -n "$MESSAGES" ]; then
    echo "$MESSAGES" >&2
    exit 1
else
    exit 0
fi
