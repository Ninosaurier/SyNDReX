#!/bin/bash

createSymfonyProject(){

  echo "Creating project ${1}"
  symfonyWebPath=$(cat /usr/share/scripts/symfonyWebPath.txt)

  cd /tmp
  composer create-project symfony/skeleton $1

  cd $1
  mv .[!.]* $symfonyWebPath
  mv ./* $symfonyWebPath
}


projectName=$1

if [[ -z "${projectName// }" ]]
  then
    echo "Please... add a project name. Script finished with doing nothing."
  else
    createSymfonyProject $projectName
fi

echo "Script finished without problems."
