#!/bin/bash
# Documentation: https://git-scm.com/docs/githooks.html#_pre_commit

set -eu

function git_staged_files_with_extension() {
    # $1 == file extension
    set +e # grep returns non-zero exit code if no matches were found
    RESULTS=$(git --no-pager diff --staged --name-only --diff-filter=d | grep -e "\.$1\$")
    set -e
    echo "$RESULTS"
}

MESSAGES=""

# Format source code
echo "PRE-COMMIT"
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
