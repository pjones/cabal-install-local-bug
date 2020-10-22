#!/usr/bin/env bash

set -eu
set -o pipefail

start=$(pwd)

test -e cabal-install-3.4.0.0-rc4.tar.gz ||
  curl -OL https://github.com/haskell/cabal/archive/cabal-install-3.4.0.0-rc4.tar.gz

test -d cabal-cabal-install-3.4.0.0-rc4 ||
  tar xzf cabal-install-3.4.0.0-rc4.tar.gz

cd cabal-cabal-install-3.4.0.0-rc4

cabal build all

cabal_34=$(cabal exec -- bash -c 'which cabal')
export PATH=$(dirname "$cabal_34"):$PATH

cd "$start"
bash bug.sh
