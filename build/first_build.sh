#!/bin/sh
echo -ne '\033c\033]0;jihunnid\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/first_build.arm64" "$@"
