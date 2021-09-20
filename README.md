# Gradescope Autograder Template
a good template for setting up gradescope autograding with python

- uses github `deploy key` to make your gradescope tests always up to date with your assignment repo
- makes it easy to test your solution locally with standard `unittest`
- makes sure your solution files are deleted before testing on gradescope, therefore unaccessible to clever students trying `import solution`

TODO:
- change to ED25519
- block certain libraries (e.g. `numpy`) for assignments where they are prohibited
- add default `timeout`s so students submissions don't do an infinite loop
- add `runner` user to subvert those very clever students https://www.seas.upenn.edu/~hanbangw/blog/hack-gs/

## setup
0. use python 3+ (3.7 is best)
1. install the requirements with `pip install -r requirements.txt`
2. create and set up a deploy key (See ["updating the assignment"](#updating-the-assignment) for why we need deploy keys) 
    1. follow instructions [here](https://developer.github.com/v3/guides/managing-deploy-keys/#deploy-keys) to create a deploy key using *RSA* and *without a passphrase*. I recommend you make the deploy key at the location `~/.ssh/deploy_key` 
    2. Go into your github repo settings (`settings` with the gear icon -> `deploy keys`) and add the public key `~/.ssh/deploy_key.pub`
    3. Copy over your private key `~/.ssh/deploy_key` to `gradescope_base/deploy_key`. I recommend that you do not push this private key to your github repo so I've added it to the `.gitignore`
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
The regular way to update assignments is to upload each new version to the gradescope server, but this can be annoying. Instead, we can upload an assignment once and from then on have the newest version pulled from github every time the test is run. 

So your code on gradescope needs to be able to pull your repo with the assignment tests. One way would be to make your repo public but this means your students could easily find the exact tests you're running! Another way would be to add your private ssh key to the code that runs the gradescope tests, but this means that anyone with that key can access all your other private repos! Instead we use a `deploy_key` that acts as a verification of your github account just for the purposes of pulling this specific repo. This means you can keep your repo private from your students, but the code on gradescope's servers will be able to pull any updates for this specific repo but for no other private repos of yours. 

Once you set this up and upload an assignment for the first time, everything is done! You just need to push your changes to your repo and they will be pulled any time a test is run so your students always get the latest updates to your tests. No need to interact with gradescope, all changes you make to your repo will be pulled by gradescope before autograding

The only time you should need to re-run `make_assignment.sh` and reupload the assignment on gradescope is if you change the name of the assignment (`$name`) or the name of the solution (`$solution`)

