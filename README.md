
# Terminal Settings - For Bash shell

Files and instructions for setting up preferred Bash shell environment.


## Changing default shell to Bash (from Zsh) and upgrading.
Since MacOS Catalina, the default shell on Mac is now Zsh. Instructions below on changing back to Bash for default

1. Using Homebrew, install the latest version of Bash: `brew install bash`

2. Verify installation, should have two versions of Bash: `which -a bash`
New version should be the first one (v5 or above).

3. Whitelist the shell, add `/usr/local/bin/bash` to the end of the file `/etc/shells` by: `sudo vim /etc/shells`

4. Change the default shell: `chsh -s /usr/local/bin/bash`
Or change for ALL users: `sudo chsh -s /usr/local/bin/bash`

5. Reopen terminal and verify the new version is being used `echo $BASH_VERSION`, done!


## Installing Bash Git Prompt
Head over to [Improving your Git Experience in Bash](https://maximomussini.com/posts/bash-git-prompt/) page and follow simple instructions. 

Custom `.git-prompt-colors.sh` file already created and in this folder.

Will need to reload `.bash_profile` using: `source ~/.bash_profile`