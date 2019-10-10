#!/bin/bash

n=$1
echo "making ${n} branches at different refs"
max_f_num=$(ls f* &> /dev/null | sort | tail -1 | sed 's/^f//')
if [[ -z "${max_f_num}" ]]
then
  max_f_num=0
fi
for i in {1..${n}}
do
  f="f$((max_f_num + i))"
  git checkout -b ${f}
  echo "${f}" > ${f}
  git add ${f}
  git commit -m "Add ${f}"
  git push origin --set-upstream origin ${f}
  git checkout master
done
