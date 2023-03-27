# .cfg
DotFiles

https://www.atlassian.com/git/tutorials/dotfiles

I use this method, it's great. WAY superior to and WAY easier than using symlinks and having to constantly copy/move and symlink things to a git repo.

I use this script (which I modified a bit from the Atlassian one) to bootstrap it on a new $HOME dir (replace "***YOUR_GIT_REPO_ADDRESS***" with your address; also, you need to copy the function ,cfg into your .*rc file for command-line use):
<code>
    #!/bin/bash
    set -euo pipefail # the usual stuff

    # TODO: copy the below function into your .*rc file
    function ,cfg {
        /usr/bin/git --git-dir="$HOME/.cfg/" --work-tree="$HOME" "$@"
    }

    # TODO: replace '***YOUR_GIT_REPO_ADDRESS***' below
    git clone --bare git@***YOUR_GIT_REPO_ADDRESS***/.cfg "$HOME/.cfg"
    ,cfg config status.showUntrackedFiles no

    if ,cfg checkout; then
        # worked fine, we're done
        echo "Checked out config."
    else
        # it failed, so assume we need to move some files out of the way
        echo "Backing up pre-existing dot files."
        mkdir -p "$HOME/.config-backup"
        ,cfg checkout 2>&1 | grep -e "\s+\." | awk "{'print $1'}" | xargs -I{} mv {} "$HOME/.config-backup"/{}
        ,cfg checkout || (echo "Still cannot checkout configs; see messages and fix." && exit 1)
        echo "Checked out config."
    fi

I also have a git alias to commit files that are tracked with a message:

    ctm = commit -a -u -m           #commit all tracked files with message

So you can do like this to commit changes and push them:

    ,cfg ctm "I modified my .zshrc"
    ,cfg push*
    </code>
