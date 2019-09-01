#!/usr/bin/env bash

# input the assignment number and the file that students have to fill out
name=$1
solution=${2:-"solution.py"}

# delete previous files if any
rm assignment$name.zip

# copy all files necessary for assignment
mkdir -p zip_assignment$name
cp gradescope_base/* zip_assignment$name/

# copy github deploy keys for this assignment
# make sure you've created github deploy keys in ~/.ssh
cp ~/.ssh/deploy_key zip_assignment$name/

# add assignment name and solution file to run_autograder
sed -i "2 i\NAME=$name" zip_assignment$name/run_autograder
sed -i "2 i\SOLUTION=$solution" zip_assignment$name/run_autograder

# zip the assignement and delete folder
zip -r -m -j assignment$name.zip zip_assignment$name/*
rmdir zip_assignment$name


