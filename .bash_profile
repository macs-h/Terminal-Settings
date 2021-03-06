############################################################
###  Useful stuff - Customise Terminal (bash) behaviour  ###
############################################################

#
# (Git) Gets the name of the current checked out branch.
#
function git-branch-name {
  git symbolic-ref HEAD 2>/dev/null | cut -d"/" -f 3
}


#
# (Git) Sets up the prompt which displays the name of the current checked out branch.
#
function git-branch-prompt {
  local branch=`git-branch-name`
  if [ $branch ]; then printf " [%s]" $branch; fi
}


#
# Nicely formats CLI prompt when the path becomes too long to display properly.
#
MYPSDIR_AWK=$(cat << 'EOF'
BEGIN { FS = OFS = "/" }
{ 
   sub(ENVIRON["HOME"], "~");
   if (length($0) > 16 && NF > 4)
      print $1,$2,".." NF-4 "..",$(NF-1),$NF
   else
      print $0
}
EOF
)
export MYPSDIR='$(echo -n "$PWD" | awk "$MYPSDIR_AWK")'


#
# CLI prompt display (with path).
# Currently displays: [User]@[host]: [PATH] <Git branch> $
#
export PS1="\[\033[92m\]\u@\h: \[\033[95m\]$(eval 'echo ${MYPSDIR}')\[\033[0;36m\]\$(git-branch-prompt)\[\033[95m\] \$\[\033[0m\] "



##############################
###  Custom CLI shortcuts  ###
##############################
alias reload='. ~/.bash_profile'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -v'
alias mkdir='mkdir -pv'
alias ls='ls -GF'
alias ll='ls -lGFh'
alias la='ls -laGFh'
alias emacsa='open -a /Applications/Emacs.app $1'
alias grep='grep --color'
alias ..='cd ..'
alias ...='cd ../../'
alias ..3='cd ../../../'
alias ..4='cd ../../../../'
alias ..5='cd ../../../../../'
alias f='open -a Finder ./'    # Open current dir in MacOS Finder window

alias showHiddenFiles='defaults write com.apple.finder AppleShowAllFiles YES'
alias hideHiddenFiles='defaults write com.apple.finder AppleShowAllFiles NO'



##############################
###  Custom git shortcuts  ###
##############################
alias git-clone='git clone -v --progress'
alias git-ac='git-add-all && git-commit' #add and commit.
alias git-status='git status --branch'
alias git-diff='git diff'
alias git-add-all='git add -v --all'
alias git-reset-hard='git reset --hard'
alias git-reset-soft='git reset --soft'
alias git-commit='git commit -a'
alias git-branch-showall='git branch -v --all'
alias git-checkout='git checkout'
alias git-fetch-all='git fetch -v --all'
alias git-log="git log --graph --pretty=format:'%Cred%x09%h%Creset %Cgreen(%cr) %C(yellow)%d%Creset %n %x09%C(bold blue)<%an>%Creset %s  %n' --abbrev-commit"
alias git-log-follow='git log --follow'
alias git-push='git push -v'
alias git-pull='git pull -v'
alias gs='git status --branch'
alias gc='git commit -a'
alias gm='git merge'
alias gcm='git checkout master'

# Git Ignore script
# Usage: gi <options>
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}


##########################
###  Used by Homebrew  ###
##########################

# For Bash Completion
[[ -f "$(brew --prefix)/etc/bash_completion" ]] && source "$(brew --prefix)/etc/bash_completion"


# For Bash Git Prompt
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
  GIT_PROMPT_ONLY_IN_REPO=1
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

# For custom git prompt colour and theme
GIT_PROMPT_ONLY_IN_REPO=1 # Use the default prompt when not in a git repo.
GIT_PROMPT_FETCH_REMOTE_STATUS=1 # '0' Avoids fetching remote status
GIT_PROMPT_SHOW_UPSTREAM=0 # Don't display upstream tracking branch
GIT_SHOW_UNTRACKED_FILES=all # Don't count untracked files (no, normal, all)
GIT_PROMPT_THEME=Custom
GIT_PROMPT_SHOW_CHANGED_FILES_COUNT=1 # uncomment to avoid printing the number of changed files

# ---------------------- Paul Crane's Original PS1 ---------------------- #
#PS1="\u@\h \[\033[0;36m\]\W\[\033[0m\]\[\033[0;32m\]\$(git-branch-prompt)\[\033[0m\] \$ "
# ----------------------------------------------------------------------- #
