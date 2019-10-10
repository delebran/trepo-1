#!/bin/bash

prefix=$1
n=$2
echo "making ${n} branches at different refs"
max_f_num=$(ls ${prefix}* 2> /dev/null | sort | tail -1 | sed 's/^f//')
if [[ -z "${max_f_num}" ]]
then
  max_f_num=0
fi
for ((i=0; i < n; ++i))
do
  f="${prefix}$((max_f_num + i))"
  git checkout -b ${f}
  echo "${f}" > ${f}
  git add ${f}
  git commit -m "Add ${f}"
  git push --set-upstream origin ${f}
  git checkout master
done
