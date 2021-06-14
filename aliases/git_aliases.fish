set -Ux GIT_MAIN_BRANCH main

# Git status alias
alias g='git status -sb'
abbr -a -g gs git status

# Git add and remove aliases
abbr -a -g ga git add
abbr -a -g gaa git add -A
abbr -a -g gr git rm

# Git branch alias
abbr -a -g gb git branch -v
alias gba='git for-each-ref --sort=committerdate refs/heads/ --format="%(authordate:short) %(color:red)%(objectname:short) %(color:yellow)%(refname:short)%(color:reset) (%(color:green)%(committerdate:relative)%(color:reset))"'
alias gbd='git for-each-ref --sort=-committerdate refs/heads/ --format="%(authordate:short) %(color:red)%(objectname:short) %(color:yellow)%(refname:short)%(color:reset) (%(color:green)%(committerdate:relative)%(color:reset))"'

# Git commit aliases
abbr -a -g gc git commit
abbr -a -g gca git commit --amend
abbr -a -g gcm git commit -m

# Git checkout aliases
abbr -a -g gco git checkout
abbr -a -g gcod git checkout develop
abbr -a -g gcom git checkout $GIT_MAIN_BRANCH
abbr -a -g gcos git checkout staging

# Git fetch aliases
abbr -a -g gf git fetch
abbr -a -g gfa git fetch --all

# Git pull alias
abbr -a -g gpull git pull --rebase

# Git pull from origin aliases
alias gprod='git pull --rebase origin develop'
alias gprom='git pull --rebase origin $GIT_MAIN_BRANCH'
alias gpros='git pull --rebase origin staging'

# Git pull from upstream aliases
alias gprud='git pull --rebase upstream develop'
alias gprum='git pull --rebase upstream $GIT_MAIN_BRANCH'
alias gprus='git pull --rebase upstream staging'

# Git push to origin aliases
abbr -a -g gp git push
abbr -a -g gpa git push --all
abbr -a -g gpod git push origin develop
abbr -a -g gpom git push origin $GIT_MAIN_BRANCH
abbr -a -g gpos git push origin staging

# Git push to upstream aliases
alias gpud='git push upstream develop'
alias gpum='git push upstream $GIT_MAIN_BRANCH'
alias gpus='git push upstream staging'

# Git push with the --force-with-lease option
alias gpofl='git push --force-with-lease origin'
alias gpufl='git push --force-with-lease upstream'

# Git rebase aliases
alias gra='git rebase --abort'
alias grc='git rebase --continue'
alias grd='git rebase develop'
alias gri='git rebase -i'
alias grm='git rebase $GIT_MAIN_BRANCH'
alias grs='git rebase staging'

# Git stash aliases
abbr -a -g gsl git stash list
abbr -a -g gsp git stash pop
abbr -a -g gss git stash save

# Git diff and log aliases
abbr -a -g gd git diff --color-words
abbr -a -g gdc git diff --cached
alias gl='git log --oneline --decorate'
alias gslog="git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"