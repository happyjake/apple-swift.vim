#!/bin/bash

swift_repo='https://github.com/apple/swift.git'
branch='master'
repo_path='apple-swift'

function get_head_commit_log() {
  git -C $1 log --pretty=format:'%h %d <%an> %s (%cd)' -n 1
}

if [[ ! -d apple-swift ]]; then
  git clone --branch $branch --single-branch --depth 1 $swift_repo $repo_path
fi

git -C $repo_path pull --depth 1
cp -R $repo_path/utils/vim/* ./

git add -A && git commit -m "update to \"$(get_head_commit_log $repo_path)\""
