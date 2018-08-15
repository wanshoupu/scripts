#!/bin/sh

USAGE="
Make sure the string arguments are quoted with single quotes
Example
./rplc_str.sh 'abc\@example.com' 'foo\@yahoo.com'
"

recurse(){
  file=$1
  if [ -d "$file" ]; then
    for f in ${file}/*; do
      recurse "$f"
    done
  elif grep -q "$old" "$f"; then
    echo perl -p -i -e "s/$old/$new/g" "$f"
    perl -p -i -e "s/$old/$new/g" "$f"
#  else
#    echo "Skip $f"
  fi
}

old="${BASH_ARGV[1]}"
new="${BASH_ARGV[0]}"

recurse .
