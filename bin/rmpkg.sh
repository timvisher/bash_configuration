#!/bin/zsh

# Delete everything installed as part of package bundle 
# specified on the command line, or the default, 
# /Library/Receipts/JavaSE6Release1.pkg

# 2007-07-19 Dave@Yost.com
# http://Yost.com/computers/rmpkg/
# Based on
# http://www.macfixit.com/article.php?story=20070719091155572

defaultPackage=/Library/Receipts/JavaSE6Release1.pkg
package=${1:-${defaultPackage}}

tmp1=/tmp/rmpkg-$$-1
tmp2=/tmp/rmpkg-$$-2

echoStatus() {
  echo 1>&2 "**** $@"
}

listBillOfMaterialsContents() {
  local bom=$package/Contents/Archive.bom
  if [[ -r $package/Contents/Archive.bom ]] ; then
    lsbom -s -f $bom
  else
    echo 1>&2 "Can't read $bom"
    return 1
  fi
}

makeScriptToRmoveListedFiles() {
  # Escape blank spaces and apostrophes.
  # Convert each line into a rm command.
  sed '
      s, ,\\ ,g
      s,',\\' ,g
      s,\./,rm -f /,
    '
}

makeCommandFileToDeletePackageFiles() {
  echoStatus Making a script to remove files
  if listBillOfMaterialsContents > $tmp1 ; then
    makeScriptToRmoveListedFiles < $tmp1 > $tmp2
  else
    return 1
  fi
}

runCommandFile() {
  echoStatus Removing files
  sudo /bin/bash $tmp2
}

removeReceiptsFile() {
  echoStatus Removing $package
  rm -rf $package
}

updatePrebinding() {
  echoStatus Updating prebinding
  sudo update_prebinding
}

TRAPEXIT() {
  rm -f $tmp1 $tmp2
}

echo 2>&1 "Removing $package along with its installed files."
makeCommandFileToDeletePackageFiles \
&& runCommandFile \
&& removeReceiptsFile \
&& updatePrebinding \
&& echoStatus Success \
|| echoStatus Failed

