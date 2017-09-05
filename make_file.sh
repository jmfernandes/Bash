
create_file()
{
  extension=$(contains ${1##*.} "${languages[@]}")
  now="$(date +'%b %d, %Y')"
  if [[ $extension == "0" ]]; then
    echo "
    File Successfully Ran
    "
    if [[ ${1##*.} == 'py' ]]; then
      echo "########################################
#
# $1
#
# Description:
#
#
# Author: Josh Fernandes
#
# Created: $now
#
# Updated:
#
#
########################################" >> $1
    fi
    if [[ ${1##*.} == 'js' ]]; then
      echo "/**
*
* $1
*
* Description:
*
*
* Author: Josh Fernandes
*
* Created: $now
*
* Updated:
*
*
*/" >> $1
    fi
    if [[ ${1##*.} == 'cs' ]]; then
      echo "////////////////////////////////////////
//
// $1
//
// Description:
//
//
// Author: Josh Fernandes
//
// Created: $now
//
// Updated:
//
//
////////////////////////////////////////" >> $1
    fi
  else
    echo "
    !!!ERROR!!! The valid extionsions are: " ${languages[@]} "
    "
  fi

echo "!====== End File Run ======!"
}

function contains(){
  local e match="$1"
  shift
  for e; do [[ "$e" == "$match" ]] && echo 0 && return 0; done
  echo 1
  return 1
}

languages=("py" "cs" "js")

echo "!====== Begin File Run ======!"

if [ $# -ne 1 ]
then
    echo "
    !!!ERROR!!! enter the filename as an arguement after the function call

    example:
        sh make_file.sh my_file.py

!====== End File Run ======!"
else
  if [[ $1 == *"."* ]]; then
    if [ -e $1 ]; then
      echo "
      !!!ERROR!!! The file $1 already exists

!====== End File Run ======!"
    else
    create_file $1
  fi
  else
    echo "
    !!!ERROR!!! need to include the file extension

!====== End File Run ======!"
  fi
fi
