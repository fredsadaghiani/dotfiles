
[[ -s "/Users/freds/.rvm/scripts/rvm" ]] && source "/Users/freds/.rvm/scripts/rvm"  # This loads RVM into a shell session.

export PATH=$PATH:~/bin:/usr/local/bin:/usr/local/sbin
export PATH=$PATH:~/w/code/web/node_modules/.bin
export PATH=$PATH:~/go/bin

mkdir -p $HOME/go
export GOPATH=$HOME/go

export SIFT_SSH_USER=$(whoami)

alias jj='jobs'
alias ls='ls -G' # Adds color on BSD
alias ll='ls -l'
alias fact="elinks -dump randomfunfacts.com | sed -n '/^| /p' | tr -d \|"
alias qt="~/w/code/tools/query_tool.py"

# Git magick
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1

alias __git_ps1="git branch 2>/dev/null | grep '*' | sed 's/* \(.*\)/(\1)/'"

# Set git autocompletion and PS1 integration
if [ -f /usr/local/git/contrib/completion/git-completion.bash ]; then
  . /usr/local/git/contrib/completion/git-completion.bash
fi

if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
  . /usr/local/etc/bash_completion.d/git-completion.bash
fi

if [ -f /usr/local/etc/bash_completion.d/go-completion.bash ]; then
  . /usr/local/etc/bash_completion.d/go-completion.bash
fi

PS1='\u@\h:\[\033[0;36m\]\w\[\033[31m\] $(__git_ps1)\[\033[00m\]\$ '

# Java crap
export JAVA_HOME=$(/usr/libexec/java_home)
export JAVA_TOOL_OPTIONS="-Dfile.encoding=UTF8 -Dapple.awt.UIElement=true"
export EDITOR=vim

alias tail_mongo='tail -f /usr/local/var/log/mongodb/output.log'

# Add ssh keys
ssh-add ~/.ssh/*.pem
ssh-add ~/.ssh/id_rsa

#shopt -s histappend # append the history to the histfile instead of overwriting it.
export HISTFILESIZE=50000
export HISTSIZE=10000
#export HISTCONTROL=ignoreboth # no duplicates and empty lines

function hg() {
  history | grep --color $1
}

GRC=`which grc`
if [ "$TERM" != dumb ] && [ -n GRC ]
then
    alias grc="$GRC -e -s --colour=auto"
    alias configure='grc ./configure'
    alias diff='grc diff'
    alias make='grc make'
    alias gcc='grc gcc'
    alias g++='grc g++'
    alias as='grc as'
    alias gas='grc gas'
    alias ld='grc ld'
    alias netstat='grc netstat'
    alias ping='grc ping'
    alias traceroute='grc /usr/sbin/traceroute'
fi

if [ -f `brew --prefix`/etc/autojump ]; then
  . `brew --prefix`/etc/autojump
fi

if [ -f $(brew --prefix)/etc/bash_completion.d ]; then
  . $(brew --prefix)/etc/bash_completion.d
fi

export LOAD_PATH="~/w/code/ops/lib/ruby:$LOAD_PATH"
rvm use 2.3.4

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/freds/.sdkman"
[[ -s "/Users/freds/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/freds/.sdkman/bin/sdkman-init.sh"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# 
source ~/w/code/tools/envsetup.sh # && update_python_deps

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/freds/w/maxdata/google-cloud-sdk/path.bash.inc' ]; then source '/Users/freds/w/maxdata/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/freds/w/maxdata/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/freds/w/maxdata/google-cloud-sdk/completion.bash.inc'; fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
