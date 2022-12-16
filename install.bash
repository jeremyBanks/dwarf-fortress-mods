#!/usr/bin/env bash
set -xeuo pipefail

pushd ../../data/installed_mods/
rm -rv ./*
popd

cp ./* ../../data/installed_mods/

