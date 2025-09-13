### Modules
* A module is a container for multiple resources that are used together. Modules can be used to create lightweight abstractions, so that you can describe your infrastructure in terms of its architecture, rather than directly in terms of physical objects.

### `feature/vpc` branch
```
git checkout -b feature/vpc
```
```
$ git branch -a
* feature/vpc
  main
  remotes/origin/main
```
### Update README.md
```
git add .
git commit -m "initial README.md"
git push --set-upstream origin feature/vpc
```
* Remote branch `remotes/origin/feature/vpc` is available now.
```
$ git branch -a
* feature/vpc
  main
  remotes/origin/feature/vpc
  remotes/origin/main
```

### How to rename `feature/vpc` branch to `develop` branch
* Step1 - Rename the local branch
    * First, switch to the branch you want to rename (if you're not already on it):
      ```
      git checkout feature/vpc
      ```
    * Then rename it locally:
      ```
      git branch -m develop
      ```

* Step2 - Push the new branch to GitLab
    * Push the renamed branch `develop` to the remote repository:
        ```
        git push origin develop
        ```
    * verify
        ```
        Total 0 (delta 0), reused 0 (delta 0), pack-reused 0
        remote: 
        remote: To create a merge request for develop, visit:
        remote:   https://gitlab.com/sailinnthu/terraform-aws-bastion-host/-/merge_requests/new?merge_request%5Bsource_branch%5D=develop
        remote: 
        To gitlab.com:sailinnthu/terraform-aws-bastion-host.git
        * [new branch]      develop -> develop
        ```
        ```
        $ git branch -a
        * develop
        main
        remotes/origin/develop
        remotes/origin/feature/vpc
        remotes/origin/main
        ```

* Step3 - Set the upstream tracking
    * Set the new branch to track the remote branch:
        ```
        $ git push --set-upstream origin develop
        Branch 'develop' set up to track remote branch 'develop' from 'origin'.
        Everything up-to-date
        ```

* Step4 - Delete the old branch from GitLab
    * Remove the old branch from the remote repository:
        ```
        $ git push origin --delete feature/vpc
        To gitlab.com:sailinnthu/terraform-aws-bastion-host.git
        - [deleted]         feature/vpc
        ```
        ```
        $ git branch -a
        * develop
        main
        remotes/origin/develop
        remotes/origin/main
        ```