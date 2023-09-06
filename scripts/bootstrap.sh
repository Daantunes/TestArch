#!/bin/bash

set -eu

printf "\x1b[34m"
echo "Welcome to the TestArch project!"
echo "Setup of your environment will commence now. Please wait..."
printf "\x1b[m\n"

# Install homebrew dependencies
printf "\x1b[34m"
echo "[1/6] Updating homebrew..."
printf "\x1b[m"
brew update

if [ -e "brew/Brewfile" ]; then
    printf "\x1b[34m"
    echo "[1/6] Installing homebrew dependencies..."
    printf "\x1b[m"

    brew bundle --file=brew/Brewfile
else
    printf "\x1b[34m"
    echo "[1/6] Installing homebrew dependencies skipped."
    printf "\x1b[m"
fi

# Install gems
if [ -e "Gemfile" ]; then
    printf "\n\x1b[34m"
    echo "[2/6] Installing ruby gems..."
    printf "\x1b[m"

    bundle install
else
    printf "\n\x1b[34m"
    echo "[2/6] Installing ruby gems skipped."
    printf "\x1b[m"
fi

# Install Tuist
if ! command -v tuist &> /dev/null; then
    printf "\n\x1b[34m"
    echo "[4/6] Installing tuist..."
    printf "\x1b[m"

    curl -Ls https://install.tuist.io | bash
else
    printf "\n\x1b[34m"
    echo "[4/6] Installation of tuist skipped."
    printf "\x1b[m"
fi

# add git pre-commit hook, if necessary
GIT_PRECOMMIT_HOOK=.git/hooks/pre-commit
if [ ! -f "$GIT_PRECOMMIT_HOOK" ]; then
    printf "\n\x1b[34m"
    echo "[5/6] Installing git pre-commit hook..."
    printf "\x1b[m"

    {
        echo "#!/bin/bash"
        echo "if [ -e \"scripts/pre-commit.sh\" ]; then"
        echo "  sh scripts/pre-commit.sh"
        echo "fi"
    } >> "$GIT_PRECOMMIT_HOOK"
    chmod +x "$GIT_PRECOMMIT_HOOK"
else
    printf "\n\x1b[34m"
    echo "[5/6] Installing git pre-commit hook skipped."
    printf "\x1b[m"
fi

# add git post-checkout hook, if necessary
GIT_POSTCHECKOUT_HOOK=".git/hooks/post-checkout"
if [ ! -f "$GIT_POSTCHECKOUT_HOOK" ]; then
    printf "\n\x1b[34m"
    echo "[6/6] Installing git post-checkout hook..."
    printf "\x1b[m"

    {
        echo "#!/bin/bash" > "$GIT_POSTCHECKOUT_HOOK"
        echo "if [ -e \"scripts/post-checkout.sh\" ]; then"
        echo "  sh scripts/post-checkout.sh \"\$@\""
        echo "fi"
    } >> "$GIT_POSTCHECKOUT_HOOK"
    chmod +x "$GIT_POSTCHECKOUT_HOOK"
else
    printf "\n\x1b[34m"
    echo "[6/6] Installing git post-checkout hook skipped."
    printf "\x1b[m"
fi
