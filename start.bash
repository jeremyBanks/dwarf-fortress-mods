#!/usr/bin/env bash
set -xeuo pipefail; shopt -s inherit_errexit  compat"${BASH_COMPAT=42}"
clear -x

taskkill.exe /im "Dwarf Fortress.exe" /t /f || echo "not running"

pushd ../
    rm -rfv ./2901970561\ \(*\) ./no_more_dead_dogs
popd

pushd ../../data/installed_mods/
    rm -rfv ./2901970561\ \(*\) ./no_more_dead_dogs
popd

cp -rv ./no_more_dead_dogs ../

pushd ../../
    rm -rf gamelog.txt errorlog.txt stdout.txt stderr.txt
    touch gamelog.txt errorlog.txt stdout.txt stderr.txt

    pushd  /mnt/c/Program\ Files\ \(x86\)/Steam/
        ./steam.exe steam://rungameid/975370
    popd

    tail -vf  gamelog.txt errorlog.txt stdout.txt stderr.txt
popd
