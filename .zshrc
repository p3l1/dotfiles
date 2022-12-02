#
# .zshrc
#
# @author Philipp Herzog
#

export PATH="/opt/homebrew/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="/Users/philipp/.oh-my-zsh"

# Tell homebrew to not autoupdate every single time it is executed
export HOMEBREW_AUTO_UPDATE_SECS=604800

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="powerlevel10k/powerlevel10k"
# This step is done by the Ansible mac-dev-playbook

# Uncomment the following line if you want to disable marking untracked files
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
HIST_STAMPS="dd.mm.yyyy"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(
    git
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Dark gray color for suggestions
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=0"

# User configuration

# You may need to manually set your language environment
export LANG=de_DE.UTF-8

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

alias zshconfig="nano ~/.zshrc"

# Add python aliases
alias python="python3"
alias pip="pip3"

# Enable thefuck
eval $(thefuck --alias)

# Add custom commands from geerlingguy/dotfiles
# Credit to Jeff Geerling @geerlingguy

# Super useful Docker container oneshots.
# Usage: dockrun, or dockrun [centos7|fedora27|debian9|debian8|ubuntu1404|etc.]
dockrun() {
 docker run -it geerlingguy/docker-"${1:-ubuntu1604}"-ansible /bin/bash
}

# Enter a running Docker container.
function denter() {
 if [[ ! "$1" ]] ; then
     echo "You must supply a container ID or name."
     return 0
 fi

 docker exec -it $1 bash
 return 0
}
