#!/bin/bash
set -x
rm -rfv android16-security-release
mkdir -pv android16-security-release
cd android16-security-release
echo android16-security-release > .android16-security-release
repo init --verbose --manifest-url=http://github.com/CE1CECL/aosp --manifest-branch=master --manifest-name=android16-security-release.xml --current-branch --no-tags --depth=1 --partial-clone --no-use-superproject --no-clone-bundle --git-lfs --no-repo-verify
repo sync --verbose --jobs=$(nproc --all) --jobs-network=$(nproc --all) --jobs-checkout=$(nproc --all) --force-sync --detach --current-branch --no-clone-bundle --no-use-superproject --no-tags --prune --no-repo-verify
rm -rfv .android16-security-release
repo manifest --verbose --output-file=android16-security-release.xml --pretty --revision-as-HEAD --suppress-upstream-revision --suppress-dest-branch
cat android16-security-release.xml
cp -rfv android16-security-release.xml ..
rm -rfv .repo
cd ..
exit 0
