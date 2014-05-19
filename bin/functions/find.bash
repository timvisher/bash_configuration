# find file, filter out paths to commonly ignore, scm files and editor backup / swap files
function _ff_common_filter () {
  grep -vE '/(.git|CVS|.svn)/' | grep -vE '.swp(/|$)'
}

function f () {
  DIR="."
  if [ -d "$1" ]; then
    DIR="$1"
    shift
  fi
  find "$DIR" -type f -name "*$1*" | _ff_common_filter
}

