#!/bin/bash

cd "$(dirname "$0")"
set -ex

app_name=$1
app_version=$2

if [[ -z "$app_version" ]]; then
    echo Usage: $0 app_name app_version
    exit
fi

dest="${app_name}/${app_version}"

mkdir -p "$dest"
cp metinfo/Makefile "${app_name}"/
cp metinfo/5.3.17/{Dockerfile,Makefile} "$dest"/

