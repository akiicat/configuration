# mac default setting "\h:\W \u\$ "
export PS1="\n$ "

# history list with iso 8601 time format
# export HISTTIMEFORMAT="%FT%T%z "

# vim colors
export TERM=xterm-256color

# mac: if realpath is not exist
# if ! type realpath > /dev/null; then
#   realpath() {
#     [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
#   }
# fi
#
# or
# GNU realpath
# If you want a "real" implementation of this command, the GNU version is available via the coreutils Homebrew formula:
# brew install coreutils

# kill all jobs
# kill "$@" $(jobs -p)
