#!/bin/bash

if [ $# -eq 0 ]; then
	echo 'Usage: ./deploy.sh version'
	exit 1
fi

echo -------------------------------------
echo 请确保代码已经全部提交
echo -------------------------------------

tag_name=$1

git push --delete origin $tag_name
git tag -d $tag_name

git tag -a $tag_name -m"-"
git push origin $tag_name
