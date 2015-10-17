alias ftmp='find . -name "*[~#]"'
alias ftmpr='find . -name "*[~#]" | xargs rm'
# find content in all files, ignore dot files.
alias ffct='find . -type f | sed  -e "/\/\./ d" | xargs grep -n'

openf () {
    if [ "$1" = "" ] ;then
	xdg-open `(find . | percol)`
    else
	xdg-open $1
    fi
}

search () {
    w3m "http://en.cppreference.com/mwiki/index.php?title=Special%3ASearch&search=$1"
}

# find content in files which match pattern, ignore dot files.
ffctp () {
    find . -type f -name "$1" | sed  -e "/\/\./ d" | xargs grep -n "$2"
}

# filt file and show tail 20 lines.
filtfv () {
    sed -n "/$1/"p $2 | tail -n 20
}

filtfva () {
    sed -n "/$1/"p $2 | less +G
}

filtfa () {
    sed -n "/$1/"p $2
}
