#!/bin/bash
set -x
rm -rfv lollipop-mr1-release
mkdir -pv lollipop-mr1-release
cd lollipop-mr1-release
echo lollipop-mr1-release > .lollipop-mr1-release
repo init --verbose --manifest-url=http://github.com/CE1CECL/aosp --manifest-branch=master --manifest-name=lollipop-mr1-release.xml --current-branch --no-tags --depth=1 --partial-clone --no-use-superproject --no-clone-bundle --git-lfs --no-repo-verify
repo sync --verbose --jobs=$(nproc --all) --jobs-network=$(nproc --all) --jobs-checkout=$(nproc --all) --force-sync --detach --current-branch --no-clone-bundle --no-use-superproject --no-tags --prune --no-repo-verify
rm -rfv .lollipop-mr1-release
repo manifest --verbose --output-file=lollipop-mr1-release.xml --pretty --revision-as-HEAD --suppress-upstream-revision --suppress-dest-branch
cat lollipop-mr1-release.xml
cp -rfv lollipop-mr1-release.xml ..
rm -rfv .repo
cd ..
exit 0
