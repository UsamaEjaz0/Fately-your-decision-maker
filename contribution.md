# For Collaborators

- No need to fork the repo. Clone the original repo.

```
git clone https://github.com/UsamaEjaz0/haha-decision-maker.git
```

- All the updates will be first done in development branch and later on I will merge it in main branch myself.

```
git checkout development
```

- Create your branch using (also switches to `branch-name` at the same time)

```
git checkout -b 'branch-name'
```

- Before creating the new branch, check if the local `development` branch and the remote `development` branch are same. If they aren't then run the below command to pull and merge the remote `development` branch into the local `development` branch.

```
git pull origin development
```

- After adding a new feature in your branch, push the branch to GitHub. Leave `main` alone. Don't merge the new branch with `development` locally or remotely yet.

```
git push origin branch-name
```

Create a new pull request on GitHub to merge the remote `branch-name` with the remote `development` branch. I'll review and merge the branches myself. After the remote `branch-name` has been merged into remote `development`, pull the remote `development` and merge it into local `development` branch.

```
git pull origin development
```

Repeat the above steps every time you need to add a new feature.

- Most importantly, delete the merged branch after it has been merged into `development`. Delete the local and remote branch.

```
git branch -d <branch-name>
git push origin --delete <branch-name>
```