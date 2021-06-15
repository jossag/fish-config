# Fish
alias alias-e="s ~/.config/fish/config.fish"

# Ignore fish greeting
set fish_greeting ""

# npm
set -gx PATH $PATH ~/.npm-global/bin

# pj
set -Ux PROJECT_PATHS ~/git

# Load aliases
source ~/.config/fish/functions/cli_aliases.fish
source ~/.config/fish/functions/git_aliases.fish
source ~/.config/fish/functions/npm_aliases.fish
source ~/.config/fish/functions/yarn_aliases.fish
source ~/.config/fish/functions/aws_aliases.fish
# source ~/.config/fish/functions/maven_aliases.fish
