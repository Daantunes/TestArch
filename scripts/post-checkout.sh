#!/bin/bash
# Documentation: https://git-scm.com/docs/githooks.html#_post_checkout

set -eu

HEAD_PREV={$1:-""}
HEAD_NEW={$2:-""}
CHECKOUT_TYPE=${3:-0}
[[ $CHECKOUT_TYPE == 1 ]] && CHECKOUT_TYPE='branch' ||                             
                             CHECKOUT_TYPE='file';
if [[ "$CHECKOUT_TYPE" != "branch" || "$HEAD_PREV" == "$HEAD_NEW" ]]; then
    # Only run on branch changes
    exit 0
fi

TUIST_CLI="tuist"
if ! command -v "$TUIST_CLI" &> /dev/null; then
    printf >&2 "\x1b[31m%s not found but needed for project generation.\x1b[m Install it:\n" "$TUIST_CLI"
    echo >&2 "  $ curl -Ls https://install.tuist.io | bash"
    echo >&2 "See https://docs.tuist.io/tutorial/get-started for more information."
    exit 1
fi

# Fetch Tuist plugins and project dependencies
tuist fetch
# Generate the project xcodeproj file
tuist generate --no-open
