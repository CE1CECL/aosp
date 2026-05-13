#!/bin/bash
set -x
rm -rfv oreo-security-release
mkdir -pv oreo-security-release
cd oreo-security-release
echo oreo-security-release > .oreo-security-release
repo init --verbose --manifest-url=http://github.com/CE1CECL/aosp --manifest-branch=master --manifest-name=oreo-security-release.xml --current-branch --no-tags --depth=1 --partial-clone --no-use-superproject --no-clone-bundle --git-lfs --no-repo-verify
repo sync --verbose --jobs=$(nproc --all) --jobs-network=$(nproc --all) --jobs-checkout=$(nproc --all) --force-sync --detach --current-branch --no-clone-bundle --no-use-superproject --no-tags --prune --no-repo-verify
rm -rfv .oreo-security-release
repo manifest --verbose --output-file=oreo-security-release.xml --pretty --revision-as-HEAD --suppress-upstream-revision --suppress-dest-branch
cat oreo-security-release.xml
cp -rfv oreo-security-release.xml ..
rm -rfv .repo
cd ..
exit 0
