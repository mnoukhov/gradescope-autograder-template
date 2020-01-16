#!/usr/bin/env bash

# CHANGE THESE FOR YOUR REPO!
GITHUB_REPO='git@github.com:mnoukhov/gradescope-autograder-template.git'
REPO_NAME="gradescope-autograder-template"


# input the assignment number and the file that students have to fill out
name=$1
solution=${2:-"solution.py"}

# delete previous files if any
rm $name.zip

# copy all files necessary for assignment
# make sure you have copied your deploy key to gradescope_base/
mkdir -p zip_$name
cp gradescope_base/* zip_$name/

# add assignment name and solution filename to run_autograder
sed "s/REPLACE_NAME/NAME=$name/" zip_$name/run_autograder > /tmp/run_autograder && mv /tmp/run_autograder zip_$name/run_autograder
sed "s/REPLACE_SOLUTION/SOLUTION=$solution/" zip_$name/run_autograder > /tmp/run_autograder && mv /tmp/run_autograder zip_$name/run_autograder
sed "s/REPLACE_REPO_NAME/REPO_NAME=$REPO_NAME/" zip_$name/run_autograder > /tmp/run_autograder && mv /tmp/run_autograder zip_$name/run_autograder

sed "s/REPLACE_REPO_NAME/REPO_NAME=$REPO_NAME/" zip_$name/setup.sh > /tmp/setup.sh && mv /tmp/setup.sh zip_$name/setup.sh
sed "s,REPLACE_GITHUB_REPO,GITHUB_REPO=$GITHUB_REPO," zip_$name/setup.sh > /tmp/setup.sh && mv /tmp/setup.sh zip_$name/setup.sh

# zip the assignement and delete folder
zip -r -m -j $name.zip zip_$name/*
rmdir zip_$name


