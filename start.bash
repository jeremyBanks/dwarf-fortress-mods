#!/usr/bin/env bash
set -xeuo pipefail; shopt -s inherit_errexit  compat"${BASH_COMPAT=42}"
clear -x

pushd ../../

rm -rvf ./data/installed_mods/*

pushd ../../../

./steam.exe steam://rungameid/975370
