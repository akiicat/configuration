#!/bin/bash

set -x

WORKSPACE_PATH=${WORKSPACE_PATH:-/tmp}
WORKSPACE_DIR=${WORKSPACE_DIR:-vim}

cd $WORKSPACE_PATH || { echo "$WORKSPACE_PATH No such file or directory" 1>&2; exit 1; }
mkdir -p $WORKSPACE_DIR || { echo "$PWD/$WORKSPACE_DIR already exists but is not a directory" 1>&2; exit 1; }

cd $WORKSPACE_DIR

url=https://github.com/akiicat/vim.git
path=$WORKSPACE_PATH/$WORKSPACE_DIR/vim
if [ -d "$path" ]; then
  cd $path
  git pull;
else
  git clone --depth=1 $url $path;
  cd $path
fi

while [[ $# -gt 0 ]]; do
    opt="$1";
    shift;
    case "$opt" in
        "tmux" )    cd $WORKSPACE_PATH/$WORKSPACE_DIR/vim/tmux    && ./install ;;
        "bash" )    cd $WORKSPACE_PATH/$WORKSPACE_DIR/vim/bash    && ./install ;;
        "vim" )     cd $WORKSPACE_PATH/$WORKSPACE_DIR/vim/vim     && ./install ;;
        "git" )     cd $WORKSPACE_PATH/$WORKSPACE_DIR/vim/git     && ./install ;;
        "docker" )  cd $WORKSPACE_PATH/$WORKSPACE_DIR/vim/docker  && ./install ;;
        *) echo >&2 "Invalid option: $opt"; exit 1;;
    esac
done

set +x
