#!/bin/bash
set -x
rm -rfv android17-release
mkdir -pv android17-release
cd android17-release
echo android17-release > .android17-release
repo init --verbose --manifest-url=http://github.com/CE1CECL/aosp --manifest-branch=master --manifest-name=android17-release.xml --current-branch --no-tags --depth=1 --partial-clone --no-use-superproject --no-clone-bundle --git-lfs --no-repo-verify
repo sync --verbose --jobs=$(nproc --all) --jobs-network=$(nproc --all) --jobs-checkout=$(nproc --all) --force-sync --detach --current-branch --no-clone-bundle --no-use-superproject --no-tags --prune --no-repo-verify
rm -rfv .android17-release
repo manifest --verbose --output-file=android17-release.xml --pretty --revision-as-HEAD --suppress-upstream-revision --suppress-dest-branch
cat android17-release.xml
cp -rfv android17-release.xml ..
rm -rfv .repo
cd ..
exit 0
