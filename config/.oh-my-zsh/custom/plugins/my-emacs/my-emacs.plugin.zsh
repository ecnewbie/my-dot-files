# Emacs 23 daemon capability is a killing feature.
# One emacs process handles all your frames whether
# you use a frame opened in a terminal via a ssh connection or X frames
# opened on the same host.

# Benefits are multiple
# - You don't have the cost of starting Emacs all the time anymore
# - Opening a file is as fast as Emacs does not have anything else to do.
# - You can share opened buffered across opened frames.
# - Configuration changes made at runtime are applied to all frames.


if "$ZSH/tools/require_tool.sh" emacs 23 2>/dev/null ; then
    export EMACS_PLUGIN_LAUNCHER="$ZSH/plugins/emacs/emacsclient.sh"

    # set EDITOR if not already defined.
    export EDITOR="${EDITOR:-${EMACS_PLUGIN_LAUNCHER}}"

    # don't change default emacs cmd.
    # alias emacs="$EMACS_PLUGIN_LAUNCHER --no-wait"
    alias e='emacs -q -nw'
    alias ec="$EMACS_PLUGIN_LAUNCHER --no-wait"
    alias emacst='env TERM=xterm-256color emacs -nw'
    alias emacsw='emacs -mm'
    alias ect='emacsclient -nw -a ""'
    alias quitemacs='emacsclient -n -e "(kill-emacs)"'

    # same than M-x eval but from outside Emacs.
    alias eeval="$EMACS_PLUGIN_LAUNCHER --eval"
    # create a new X frame
    alias eframe='emacsclient --alternate-editor "" --create-frame'

    # to code all night long
    alias emasc=emacs
    alias emcas=emacs

    # Write to standard output the path to the file
    # opened in the current buffer.
    function efile {
        local cmd="(buffer-file-name (window-buffer))"
        "$EMACS_PLUGIN_LAUNCHER" --eval "$cmd" | tr -d \"
    }

    # Write to standard output the directory of the file
    # opened in the the current buffer
    function ecd {
        local cmd="(let ((buf-name (buffer-file-name (window-buffer))))
                     (if buf-name (file-name-directory buf-name)))"

        local dir="$($EMACS_PLUGIN_LAUNCHER --eval $cmd | tr -d \")"
        if [ -n "$dir" ] ;then
            echo "$dir"
        else
            echo "can not deduce current buffer filename." >/dev/stderr
            return 1
        fi
    }
fi

## Local Variables:
## mode: sh
## End: