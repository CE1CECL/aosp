#!/bin/bash
set -x
rm -rfv oreo-mr1-security-release
mkdir -pv oreo-mr1-security-release
cd oreo-mr1-security-release
echo oreo-mr1-security-release > .oreo-mr1-security-release
repo init --verbose --manifest-url=http://github.com/CE1CECL/aosp --manifest-branch=master --manifest-name=oreo-mr1-security-release.xml --current-branch --no-tags --depth=1 --partial-clone --no-use-superproject --no-clone-bundle --git-lfs --no-repo-verify
repo sync --verbose --jobs=$(nproc --all) --jobs-network=$(nproc --all) --jobs-checkout=$(nproc --all) --force-sync --detach --current-branch --no-clone-bundle --no-use-superproject --no-tags --prune --no-repo-verify
rm -rfv .oreo-mr1-security-release
repo manifest --verbose --output-file=oreo-mr1-security-release.xml --pretty --revision-as-HEAD --suppress-upstream-revision --suppress-dest-branch
cat oreo-mr1-security-release.xml
cp -rfv oreo-mr1-security-release.xml ..
rm -rfv .repo
cd ..
exit 0
