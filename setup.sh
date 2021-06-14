#!/usr/bin/env bash

USER_HOME="`env | grep -e ^HOME= | cut -d= -f2`"
CURRENT_DIR="$(dirname "$(readlink -f "$0")")"

. $CURRENT_DIR/link.sh

if [ -z "$CURRENT_DIR" ]; then
	# error; for some reason, the path is not accessible
	# to the script (e.g. permissions re-evaled after suid)
	echo "Current dir is not accessible to the script, exiting"
	exit 1
fi

link_file "config.fish" "." ".config/fish"
link_file "omf.fish" "." ".config/fish/conf.d"
link_file "cli_aliases.fish" "aliases" ".config/fish/functions"
link_file "git_aliases.fish" "aliases" ".config/fish/functions"
link_file "npm_aliases.fish" "aliases" ".config/fish/functions"
link_file "yarn_aliases.fish" "aliases" ".config/fish/functions"
link_file "maven_aliases.fish" "aliases" ".config/fish/functions"
link_file "aws_aliases.fish" "aliases" ".config/fish/functions"
