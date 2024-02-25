#
# .zshrc
#
# @author Philipp Herzog
#

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Add Homebrew to PATH
export PATH="/opt/homebrew/bin:$PATH"
# Add Java OpenJDK to PATH
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
# Add Android SDK to PATH
export PATH="/Users/philipp/Library/Android/sdk/emulator:$PATH"
export PATH="/Users/philipp/Library/Android/sdk/platform-tools:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="/Users/philipp/.oh-my-zsh"

# Tell homebrew to not autoupdate every single time it is executed
export HOMEBREW_AUTO_UPDATE_SECS=604800

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="powerlevel10k/powerlevel10k"
source /opt/homebrew/opt/powerlevel10k/share/powerlevel10k/powerlevel10k.zsh-theme

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
    docker
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

 docker exec -it $1 ash
 return 0
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Alias for printing my public key
alias pk="ssh-add -L"


# GPG related settings
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

# SSH remote access
remote_access_start() {
 ssh -f -N -D 1337 tor
}

remote_access_check() {
 ssh -O check tor
}

remote_access_stop() { 
 ssh -O exit tor
}
