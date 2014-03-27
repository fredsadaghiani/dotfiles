
[[ -s "/Users/freds/.rvm/scripts/rvm" ]] && source "/Users/freds/.rvm/scripts/rvm"  # This loads RVM into a shell session.

export PATH=$PATH:~/bin:/usr/local/bin:/usr/local/sbin

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

PS1='\u@\h:\[\033[0;36m\]\w\[\033[31m\] $(__git_ps1)\[\033[00m\]\$ '

# Java crap
export JAVA_HOME=$(/usr/libexec/java_home)
export JAVA_TOOL_OPTIONS="-Dfile.encoding=UTF8 -Dapple.awt.UIElement=true"
export EDITOR=vim

alias tail_mongo='tail -f /usr/local/var/log/mongodb/output.log'

# Add ssh keys
ssh-add ~/.ssh/*.pem

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
    alias colourify="$GRC -es --colour=auto"
    alias configure='colourify ./configure'
    alias diff='colourify diff'
    alias make='colourify make'
    alias gcc='colourify gcc'
    alias g++='colourify g++'
    alias as='colourify as'
    alias gas='colourify gas'
    alias ld='colourify ld'
    alias netstat='colourify netstat'
    alias ping='colourify ping'
    alias traceroute='colourify /usr/sbin/traceroute'
fi

# EC2 tools
export EC2_HOME=~/w/ec2-api-tools-1.6.1.2
export PATH=$PATH:$EC2_HOME/bin
export AWS_ACCESS_KEY=AKIAJRPUTB6XRJWKAJHQ
export AWS_SECRET_KEY=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

if [ -f `brew --prefix`/etc/autojump ]; then
  . `brew --prefix`/etc/autojump
fi

if [ -f $(brew --prefix)/etc/bash_completion.d ]; then
  . $(brew --prefix)/etc/bash_completion.d
fi

rvm use 2.1.1
