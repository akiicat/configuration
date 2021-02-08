#!/bin/bash

set -x

WORKSPACE_PATH=${WORKSPACE_PATH:-/tmp}
WORKSPACE=${WORKSPACE:-vim}

cd $WORKSPACE_PATH || { echo "$WORKSPACE_PATH No such file or directory" 1>&2; exit 1; }
mkdir -p $WORKSPACE || { echo "$PWD/$WORKSPACE already exists but is not a directory" 1>&2; exit 1; }

cd $WORKSPACE

# wget will overwrite the exist file
wget https://www.busybox.net/downloads/binaries/1.21.1/busybox-x86_64 -o ./busybox || { echo "download failed" 1>&2; exit 1; }
chmod u+x ./busybox

[[ -f "busybox" ]] || { echo "busybox not exist"; exit 1; }

wget https://github.com/akiicat/vim/archive/master.zip -o ./vim.zip || { echo "download failed" 1>&2; exit 1; }
./busybox unzip vim.zip -d .


while [[ $# -gt 0 ]];
do
    opt="$1";
    shift;
    case "$opt" in
        "all" ) all=1 ;;
        "tmux" ) cd $WORKSPACE_PATH/$WORKSPACE/tmux && ./install ;;
        "bash" ) cd $WORKSPACE_PATH/$WORKSPACE/bash && ./install ;;
        "vim" )  cd $WORKSPACE_PATH/$WORKSPACE/vim  && ./install ;;
        "git" )  cd $WORKSPACE_PATH/$WORKSPACE/git  && ./install ;;
        "docker" ) docker=1 ;;
        *) echo >&2 "Invalid option: $opt"; exit 1;;
    esac
done


url=https://github.com/akiicat/vim.git
path=/tmp/akiicat/vim
if [ -d "$path" ]; then
  cd $path
  git pull;
else
  git clone --depth=1 $url $path;
  cd $path
fi

if [[ $all == "1" ]] || [[ $bash == "1" ]];
then
        echo "Install bash"
        cd "$path/bash" && ./install
fi
if [[ $all == "1" ]] || [[ $tmux == "1" ]];
then
        echo "Install tmux"
        cd "$path/tmux" && ./install
fi
if [[ $all == "1" ]] || [[ $git == "1" ]];
then
        echo "Install git"
        cd "$path/git" && ./install
fi
if [[ $all == "1" ]] || [[ $vim == "1" ]];
then
        echo "Install vim"
        cd "$path/vim" && ./install
fi
if [[ $all == "1" ]] || [[ $docker == "1" ]];
then
        echo "Install docker"
        cd "$path/docker" && ./install
fi

set +x
