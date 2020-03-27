#!/bin/bash

# Test 1
echo "master / commit 0" > file.txt
git add file.txt
git commit -m "Added commit 0"
echo "master / commit 1" > file.txt
git add file.txt
git commit -m "Added commit 1"
git push
echo "Press [ENTER] to continue"
read
git tag 0.1.0 HEAD^
git push --tags
# Expected result in build: "master / commit 0"

# Test 2
echo "Press [ENTER] to continue"
read
echo "master / commit 2" > file.txt
git add file.txt
git commit -m "Added commit 2"
git push
git tag release-0.2.0 HEAD
git push --tags
# Expected result in build: "master / commit 2"

# Test 3
echo "Press [ENTER] to continue"
read
git tag 0.3.0 HEAD^
git push --tags
# Expected result in build: "master / commit 1"

# Test 4
echo "Press [ENTER] to continue"
read
git checkout HEAD^
git checkout -b test4
echo "test4 / commit 3" > file.txt
git add file.txt
git commit -m "Added commit 3"
git push --set-upstream origin test4
git tag release-0.4.0 HEAD
git push --tags
# Expected result in build: "test4 / commit 3"

# Cleanup
echo "Ready for cleanup?"
echo "Press [ENTER] to continue"
read
git checkout master
git reset --hard HEAD~3
git push -f
git branch -D test4
git push origin --delete test4
git tag -d 0.1.0
git tag -d release-0.2.0
git tag -d 0.3.0
git tag -d release-0.4.0
git push --delete origin 0.1.0
git push --delete origin release-0.2.0
git push --delete origin 0.3.0
git push --delete origin release-0.4.0

