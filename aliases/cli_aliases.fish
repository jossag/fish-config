alias c="clear"
alias q="exit"
alias quit="exit"
alias less="less -x 4"
alias pw="pwgen 8 1 -y"
alias https='http --default-scheme=https'
alias hosts="sudo cat /etc/hosts"

abbr -a -g l ls -lah
abbr -a -g ff find . -name
abbr -a -g untar tar -zxvf

# Jsonify
alias jsonify="grep '\''^[\[|\{]'\'' | python -m json.tool"

# mkdir && cd
function mkcd
	command mkdir -p $argv; and cd $argv
end

# change directories easily
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# apt
abbr -a -g aget sudo apt-get
abbr -a -g aupdate sudo apt-get update
abbr -a -g ainstall sudo apt-get install
alias upgrade="sudo apt update; and sudo apt dist-upgrade; and sudo apt autoremove"

# Sublime
function s
	command /opt/sublime_text/sublime_text "$argv" > /dev/null 2>&1 &
end

# Melt
function melt
	command melt $argv meta.attr.titles=1 meta.attr.titles.markup=#timecode# -attach data_show dynamic=1
end