#!/bin/sh

count_recurse(){
  file=$1
  if [ -d "$file" ]; then
    for f in ${file}/*; do
      count_recurse "$f"
    done
  elif [[ $f =~ .*\.java$ ]]; then
    cnt=$(2>/dev/null grep -c "$char" "$f")
    echo ${cnt} "$f"
#  else
#    echo "Skip $f"
  fi
}

char="${BASH_ARGV[0]}"

echo "Counting $char..."
count_recurse .
