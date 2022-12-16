#!/usr/bin/env bash
set -xeuo pipefail; shopt -s inherit_errexit  compat"${BASH_COMPAT=42}"
clear -x

rm -rvf ../../data/installed_mods/*
rm -rvf ../2*
cp -r ./* ../../data/installed_mods/
