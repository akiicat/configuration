#!/bin/bash

all=0
tmux=0
bash=0
vim=0
git=0

while [[ $# -gt 0 ]];
do
    opt="$1";
    shift;
    case "$opt" in
        "all" ) all=1 ;;
        "tmux" ) tmux=1 ;;
        "bash" ) bash=1 ;;
        "vim" ) vim=1 ;;
        "git" ) git=1 ;;
        *) echo >&2 "Invalid option: $opt"; exit 1;;
    esac
done


if [[ "$OSTYPE" == "linux-gnu" ]]; then
  if [ -f /etc/lsb-release ]; then
    sudo apt update -y
    sudo apt install -y git
  fi
fi


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

