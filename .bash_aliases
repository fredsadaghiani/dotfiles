
# Override command aliases
alias less='less -I'
alias lt='ls -lthr'
alias ll='ls -l'

function mr() {
    echo "$1/$('ls' -t $1 | head -n 1)";
}
function wiki() {
    dig +short txt "$*".wp.dg.cx
}
function mans() {
  man $1 | less -p "^ +$2";
}

# ------------------------------------------------------------------------------
# directory navigation shortcuts
# ------------------------------------------------------------------------------

# from http://daniele.livejournal.com/76011.html
function up()
{
    dir=""
    if [ -z "$1" ]; then
        dir=..
    elif [[ $1 =~ ^[0-9]+$ ]]; then
        x=0
        while [ $x -lt ${1:-1} ]; do
            dir=${dir}../
            x=$(($x+1))
        done
    else
        dir=${PWD%/$1/*}/$1
    fi
    cd "$dir";
}

function upstr()
{
    echo "$(up "$1" && pwd)";
}

# http://mattie.posterous.com/some-handy-bash-commands
# down somesubdir
#
# Find a directory below this that matches the word provided
#   (locate-based)
function down() {
    dir=""
    if [ -z "$1" ]; then
        dir=.
    fi
    dir=$(locate -n 1 -r $PWD.*/$1$)
    cd "$dir";
}
