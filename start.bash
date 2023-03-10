#!/usr/bin/env bash
set -vxeuo pipefail; shopt -s inherit_errexit  compat"${BASH_COMPAT=42}"
clear -x

taskkill.exe /im "Dwarf Fortress.exe" /t /f || echo "not running"

python3 build.py

git status
git add .
git add --all
git commit --no-edit --allow-empty-message --all || echo "nothing to commit"
git status

rm -rfv ../2901970561\ \(*\)
rm -rfv ../2903102268\ \(*\)
rm -rfv ../2903304786\ \(*\)\
rm -rfv ../../data/installed_mods/*

declare version="$(cat version.txt)"
cp -rv ./no_more_dead_dogs ../2901970561\ \($version\)
cp -rv ./guinea_pigs ../2903102268\ \($version\)
cp -rv ./cavia ../2903304786\ \($version\)

pushd ../../
    rm -rf gamelog.txt errorlog.txt stdout.txt stderr.txt
    touch gamelog.txt errorlog.txt stdout.txt stderr.txt

    pushd  /mnt/c/Program\ Files\ \(x86\)/Steam/
        ./steam.exe steam://rungameid/975370
    popd

    tail -vf  gamelog.txt errorlog.txt stdout.txt stderr.txt
popd
