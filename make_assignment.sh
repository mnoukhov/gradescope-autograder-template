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
sed -i "2 i\NAME=$name" zip_$name/run_autograder
sed -i "2 i\SOLUTION=$solution" zip_$name/run_autograder
sed -i "2 i\REPO_NAME=$REPO_NAME" zip_$name/run_autograder

sed -i "2 i\GITHUB_REPO=$GITHUB_REPO" zip_$name/setup.sh
sed -i "2 i\REPO_NAME=$REPO_NAME" zip_$name/setup.sh

# zip the assignement and delete folder
zip -r -m -j $name.zip zip_$name/*
rmdir zip_$name


