#!/usr/bin/env bash

set -eux
set -o pipefail

# Record the version number:
cabal --version

# The build will succeed:
cabal --store-dir="$(pwd)/.cabal" build

# But the install will fail:
cabal --store-dir="$(pwd)/.cabal" install
