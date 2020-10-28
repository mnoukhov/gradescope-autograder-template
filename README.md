# Gradescope Autograder Template
a good template for setting up gradescope autograding with python

- uses github `deploy key` to make your gradescope tests always up to date with your assignment repo
- makes it easy to test your solution locally with standard `unittest`
- makes sure your solution files are deleted before testing on gradescope, therefore unaccessible to clever students trying `import solution`

TODO:
- block certain libraries (e.g. `numpy`) for assignments where they are prohibited
- add default `timeout`s so students submissions don't do an infinite loop
- add `runner` user to subvert those very clever students https://www.seas.upenn.edu/~hanbangw/blog/hack-gs/

## setup
0. use python 3+ (3.7 is best)
1. install the requirements with `pip install -r requirements.txt`
2. follow instructions [here](https://developer.github.com/v3/guides/managing-deploy-keys/#deploy-keys) to create a deploy key. I recommend you make a `read-only` deploy key and regardless of where you put the deploy key, copy it over to `gradescope_base/deploy_key`. (See ["updating the assignment"](#updating-the-assignment) for why we need deploy keys) 

3. In `make_assignment.sh`, change the value of `GITHUB_REPO` to the git address of your repo (`git@github.com/...`) and the change the value of `REPO_NAME` to the name of your repo (e.g this one would be `gradescope_autograder_template`)

## making a new assignment
1. create a new folder with your assignment name `$name`
2. in the assignment folder, create a solution template file (or folder) that students will have to complete (e.g. `solution_template.py`
3. in the assignment folder, create a completed solution file (or folder) `$solution`
4. in the assignment folder, write `unittest` tests for the solution making sure that each file starts with `test_`

look at `assignment0` for an example!

## running your tests locally
you can run all your tests in the assignment folder with `unittest`
```
cd assignment0
python -m unittest *
```

## upload the assignment on gradescope
1. create the assignment zip with `./make_assignment.sh $name $solution`
2. upload the resulting `$name.zip` to gradescope

check assignment 0 for an example, it was created with `./make_assignment.sh assignment0 solution.py`

## updating the assignment
to make assignment updating easier, we can submit an assignment test once and from then on have the newest version pulled from github every time the test is run, this is why we use the `deploy_key` that will let gradescope read the repo

So you just need to push your changes to this repo and that's it! No need to interact with gradescope, all changes you make to your repo will be pulled by gradescope before autograding

The only time you should need to re-run `make_assignment.sh` and reupload the assignment on gradescope is if you change the name of the assignment (`$name`) or the name of the solution (`$solution`)

