#!/bin/bash
set -x
rm -rfv android10-security-release
mkdir -pv android10-security-release
cd android10-security-release
echo android10-security-release > .android10-security-release
repo init --verbose --manifest-url=http://github.com/CE1CECL/aosp --manifest-branch=master --manifest-name=android10-security-release.xml --current-branch --no-tags --depth=1 --partial-clone --no-use-superproject --no-clone-bundle --git-lfs --no-repo-verify
repo sync --verbose --jobs=$(nproc --all) --jobs-network=$(nproc --all) --jobs-checkout=$(nproc --all) --force-sync --detach --current-branch --no-clone-bundle --no-use-superproject --no-tags --prune --no-repo-verify
rm -rfv .android10-security-release
repo manifest --verbose --output-file=android10-security-release.xml --pretty --revision-as-HEAD --suppress-upstream-revision --suppress-dest-branch
cat android10-security-release.xml
cp -rfv android10-security-release.xml ..
rm -rfv .repo
cd ..
exit 0
