set -Ux GIT_MAIN_BRANCH main

abbr -a -g gs git status
alias gl="git log --pretty=format:'%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s' --date=short"
abbr -a -g gpl git pull
