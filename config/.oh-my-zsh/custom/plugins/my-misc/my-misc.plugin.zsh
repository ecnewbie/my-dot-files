alias ftmp='find . -name "*[~#]"'
alias ftmpr='find . -name "*[~#]" | xargs rm'
# find content in all files, ignore dot files.
alias ffct='find . -type f | sed  -e "/\/\./ d" | sed "/^/ {s/^/\"/; s/$/\"/; p}" | xargs grep -n'

openf () {
    if [ "$1" = "" ] ;then
	    xdg-open `(find . | percol)`
    else
	    xdg-open $1
    fi
}

search-cppreference () {
    w3m "http://en.cppreference.com/mwiki/index.php?search=$1"
}

search-boost () {
    w3m "http://www.google.com.hk/search?hl=zh-CN&q=$1+site:boost.org"
}

search-wiki () {
    w3m "https://en.wikipedia.org/w/index.php?search=$1"
}

search-archwiki () {
    w3m "https://wiki.archlinux.org/index.php?search=$1"
}

search-stackoverflow () {
    w3m "http://www.google.com.hk/search?hl=zh-CN&q=$1+site:stackoverflow.com"
}

# find content in files which match pattern, ignore dot files.
ffctp () {
    find . -type f -name "$1" | sed  -e "/\/\./ d" | sed '/^/ {s/^/\"/; s/$/\"/; p}' | xargs grep -n "$2"
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

setopt shwordsplit                                    # Support $CC
bindkey -e                                            # Use emacs key bindings
bindkey "\ef" emacs-forward-word                      # [Esc-f] - emacs like forward word.
