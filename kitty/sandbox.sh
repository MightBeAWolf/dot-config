#!/usr/bin/env bash
dir=$(mktemp -d -t sandbox.XXXXXXXX) || exit 1

cleanup() {
    chmod -R u+w -- "$dir" 2>/dev/null   # so read-only files don't block removal
    rm -rf -- "$dir"
}
trap cleanup EXIT
trap 'exit 129' HUP    # tab/window closed
trap 'exit 143' TERM

cd "$dir" || exit 1
SANDBOX_DIR=$dir bash -i
