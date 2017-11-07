#!/bin/bash
create_file()
{
  extension=$(contains ${1##*.} "${languages[@]}")
  now="$(date +'%b %d, %Y')"
  if [[ $extension == "0" ]]; then
    echo "# Successfully created $1"
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
      echo "/*
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
    if [[ ${1##*.} == 'ts' ]]; then
      echo "/*
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
    if [[ ${1##*.} == 'cpp' ]]; then
      echo "/*
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
    if [[ ${1##*.} == 'hpp' ]]; then
      echo "/*
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
    if [[ ${1##*.} == 'txt' ]]; then
      echo "/*
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
    if [[ ${1##*.} == 'html' ]]; then
      echo '<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>
    <meta name="description" content="A website">
    <meta name="author" content="Josh Fernandes">
  </head>
  <body>

  <!-- Necessary Library Scripts -->
  </body>
</html>' >> $1
    fi
  else
    echo "
    !!!ERROR!!! The valid extionsions are: " ${languages[@]} "
    "
  fi

}

function contains(){
  local e match="$1"
  shift
  for e; do [[ "$e" == "$match" ]] && echo 0 && return 0; done
  echo 1
  return 1
}

languages=("py" "cs" "js" "ts" "cpp" "hpp" "html" "txt")

if [ $# -ne 1 ]
then
    echo "
    !!!ERROR!!! enter the filename as an arguement after the function call

    example:
        sh make_file.sh my_file.py
"
else
  if [[ $1 == *"."* ]]; then
    if [ -e $1 ]; then
      echo "
    !!!ERROR!!! The file $1 already exists
"
    else
    create_file $1
  fi
  else
    echo "
    !!!ERROR!!! need to include the file extension
"
  fi
fi
