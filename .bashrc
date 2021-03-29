# If not running interactively, don't do anything
[ -z "$PS1" ] && return


# ------------------------------------
# ALIASES
# ------------------------------------
# Edit .bashrc
alias bashedit='sudo open -a TextEdit ~/.bashrc'

# Force terminal to recognize changes to .bashrc
alias bashrefresh='source ~/.bashrc'

# Ideal directory listing
alias ll="ls -laFG"
# -l list in long format
# -F Display a...
#       slash (`/') immediately after each pathname that is a directory,
#       asterisk (`*') after each that is executable,
#       at sign (`@') after each symbolic link
#       equals sign (`=') after each socket,
#       percent sign (`%') after each whiteout,
#       vertical bar (`|') after each that is a FIFO.
# -G = Color
# -a = Show hidden files

# Ask before removing files
alias rm='rm -i'

# Search history. Example usage: `histg git` to recent commands that use git
alias histg="history | grep"

# Get your current IP
alias myip="curl http://ipecho.net/plain; echo"

# Example alias for SSH'ing into a server
alias myserver="ssh user@111.111.111.111"

# Example alias for quickly getting to a commonly used directory
alias htdocs='cd /Applications/XAMPP/htdocs'


# ------------------------------------
# Color variables
# ------------------------------------
# Regular Colors
Black='\[\033[0;30m\]'
Red='\[\033[0;31m\]'
Green='\[\033[0;32m\]'
Yellow='\[\033[0;33m\]'
Blue='\[\033[0;34m\]'
Purple='\[\033[0;35m\]'
Cyan='\[\033[0;36m\]'
White='\[\033[0;37m\]'
Light_Gray='\[\033[0;37m\]'

# Reset colors
NONE='\[\033[0;0m\]'



# ------------------------------------
# Configure prompt
# Includes special handling for git repos
# ------------------------------------
# When in a git repo, this method is used to determine the current branch
function parse_git_branch {
    git branch 2>/dev/null | grep '^*' | sed 's_^..__' | sed 's_\(.*\)_(\1)_'
}

# When in a git repo, this method is used to determine if there are changes
function git_dirty {
  if [[ -n $(git status -s --ignore-submodules=dirty 2> /dev/null) ]]; then
    echo "!"
  else
    echo ""
  fi
}

# Variables
ps1_dir="$Purple\w$NONE"
ps1_git="$Cyan \$(parse_git_branch)$Red \$(git_dirty)$NONE "

export PS1="${ps1_dir}${ps1_git}\$ "


# ------------------------------------
# MOTD (Message of the Day)
# What you see when Terminal opens
# ------------------------------------

echo "----------------------------"
echo "Loaded ~/.bashrc"
echo ""
echo "To edit run: bashedit"
echo "To refresh run: bashrefresh"
echo "All aliases: alias"
echo "----------------------------"

alias ll -as='ll'
alias S4='cd ~/S4/sigdca-s41-webapp'
alias S42F='cd ~/S42/S42-front'
alias S42B='cd ~/S42/S42-back'
alias cleanstallnotest="mvn clean install -Dmaven.test.skip=true"
alias S42G="cd ~/s42-geoserver-workspace"
alias S43F="cd ~/S43/s43-front/"
alias S43B="cd ~/S43/s43-back/"
alias refet="cd ~/sref-et/"
alias Lrefet="cd ~/sref-et/ && mvn clean install generate-sources -Dmaven.test.skip=true && java -jar -Dspring.profiles.active=dev sref-et-back-spring-webapp/target/referentiel-et-back-springboot-0.2.0-SNAPSHOT.war"
alias glog="git log --format=format:\"%C(auto)%h %C(green)%aN%Creset %s\""
alias dlub="git fetch -p && for branch in $(git for-each-ref --format '%(refname) %(upstream:track)' refs/heads | awk '$2 == "[gone]" {sub("refs/heads/", "", $1); print $1}'); do git branch -D $branch; done"
alias co="git checkout"
alias ng-sidca="cd ~/ng-sidca/"
alias common="cd ~/sigdca-common/"
alias suit="cd /D/Dvpt/Projets/Dev2022/suit/suit"
alias servesuit="node --max_old_space_size=8048 ./node_modules/@angular/cli/bin/ng serve"
alias ignoreuntracked="git ls-files --others --exclude-standard >> .gitignore"
