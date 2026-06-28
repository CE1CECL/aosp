#!/bin/bash
set -x
rm -rfv marshmallow-mr2-release
mkdir -pv marshmallow-mr2-release
cd marshmallow-mr2-release
echo marshmallow-mr2-release > .marshmallow-mr2-release
repo init --verbose --manifest-url=http://github.com/CE1CECL/aosp --manifest-branch=master --manifest-name=marshmallow-mr2-release.xml --current-branch --no-tags --depth=1 --partial-clone --no-use-superproject --no-clone-bundle --git-lfs --no-repo-verify
repo sync --verbose --jobs=$(nproc --all) --jobs-network=$(nproc --all) --jobs-checkout=$(nproc --all) --force-sync --detach --current-branch --no-clone-bundle --no-use-superproject --no-tags --prune --no-repo-verify
rm -rfv .marshmallow-mr2-release
repo manifest --verbose --output-file=marshmallow-mr2-release.xml --pretty --revision-as-HEAD --suppress-upstream-revision --suppress-dest-branch
cat marshmallow-mr2-release.xml
cp -rfv marshmallow-mr2-release.xml ..
rm -rfv .repo
cd ..
exit 0
