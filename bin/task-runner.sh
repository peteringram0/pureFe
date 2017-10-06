#!/bin/bash

# Read JSON file value
function readJson {
  UNAMESTR=`uname`
  if [[ "$UNAMESTR" == 'Linux' ]]; then
    SED_EXTENDED='-r'
  elif [[ "$UNAMESTR" == 'Darwin' ]]; then
    SED_EXTENDED='-E'
  fi;

  VALUE=`grep -m 1 "\"${2}\"" ${1} | sed ${SED_EXTENDED} 's/^ *//;s/.*: *"//;s/",?//'`

  if [ ! "$VALUE" ]; then
    echo "Error: Cannot find \"${2}\" in ${1}" >&2;
    exit 1;
  else
    echo $VALUE ;
  fi;
}

# Output file variable
declare -x OUTPUT=$(readJson ./package.json pureFE.output)"/"

while getopts ":bwt" optname
  do
    case "$optname" in
    "b") # BUILD:
        sh bin/task-runner.build.sh
        sh bin/task-runner.assets.sh
        ;;
    "w") # WATCH:
        sh bin/task-runner.build.sh
        sh bin/task-runner.assets.sh
        sh bin/task-runner.watch.sh
        ;;
    "t") # ASSETS:
        sh bin/task-runner.assets.sh
        ;;
    esac
  done
