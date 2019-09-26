# Gradescope Autograder Template
a good template for setting up gradescope autograding with python

- uses github `deploy key` to make your gradescope tests always up to date with your assignment repo
- makes it easy to test your solution locally with standard `unittest`
- makes sure your solution files are deleted before testing on gradescope, therefore unaccessible to clever students trying `import solution`

TODO:
- allow for preventing student `print` output so they can't cheat by printing the test cases you use
- allow blocking certain libraries (e.g. `numpy`) for assignments where they are prohibited
- maybe make default integration tests such that you write `solution.py` and `solution_template.py` and tests are automatically created

## setup
0. use python 3+ (3.7 is best)
1. install the requirements
```
pip install -r requirements.txt
```
2. to make assignment updating easier, we can submit an assignment test once and from then on have the newest version pulled from github every time the test is run, to do this you need to create a github `deploy_key` that will let gradescope read the repo

follow instructions [here](https://developer.github.com/v3/guides/managing-deploy-keys/#deploy-keys). I recommend you make a `read-only` deploy key and regardless of where you put the deploy key, copy it over to `gradescope_base/deploy_key`

3. In `make_assignment.sh`, change the value of `GITHUB_REPO` to the git address of your repo (`git@github.com/...`) and the change the value of `REPO_NAME` to the name of your repo (e.g this one would be `gradescope_autograder_template`)

3. change the `$YOUR_REPO` (your github repo) and `$REPO_FOLDER` (the folder the repo is cloned to) variables in the `gradescope_base/run_autograder` and `gradescope_base/setup.sh`


## making a new assignment
1. create a new folder with your assignment name `$name`
2. in the assignment folder, create a solution template file (or folder) that students will have to complete
3. in the assignment folder, create a completed solution file (or folder) `$solution`
4. in the assignment folder, write `unittest` tests for the solution making sure that each file starts with `test_`

look at `assignment0` for an example!

## running your tests locally
you can run all your tests in the assignment folder with `unittest`
```
python -m unittest *
```

## upload the assignment on gradescope
1. create the assignment zip with `./make_assignment.sh $name $solution`
2. upload the resulting `$name.zip` to gradescope

check assignment 0 for an example, it was created with `./make_assignment.sh assignment0 solution.py`

## updating the assignment
because we're using the github `deploy_key` you just need to push your changes to this repo and that's it! No need to interact with gradescope, all changes you make to your repo will be pulled by gradescope before autograding

the only time you should need to re-run `make_assignment.sh` and reupload the assignment on gradescope is if you change the name of the assignment (`$name`) or the name of the solution (`$solution`)

