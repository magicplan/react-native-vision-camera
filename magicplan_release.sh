#!/bin/bash

set -eu

script_dir="$(cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P)"
parent_dir="$(dirname "$script_dir")"

# Go to script dir
cd "$script_dir"
yarn
yarn build

# Remove all files in parent dir except for package folder and gitignore
cd "$parent_dir"
rm -r ./docs
rm -r ./CODE_OF_CONDUCT.md
rm -r ./CONTRIBUTING.md
rm -r ./tea.yaml

# Copy all files from package to parent dir
cd "$script_dir"
cp -r ./* ../


cd "$parent_dir"
rm -r ./package
rm -r .gitignore
rm -r .github
rm -r ./node_modules
rm -r ./scripts
rm -r ./yarn.lock
rm -r ./tsconfig.json
rm -r ./example

git add .
git commit -m "Release"

rm -r ./magicplan_release.sh
