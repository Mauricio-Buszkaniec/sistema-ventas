#!/bin/bash

REMOTE_NAME="origin"
BRANCH_NAME="develop"

git fetch

CHANGES=$(git diff --stat HEAD)

if [ -z "$CHANGES" ]; then
	echo "No hay cambios para subir"
	echo "- Sin cambios el $(date)" >> README.md
else

git add .
git commit -m "Commit automatico del $(date '+%Y-%m-%d')"
git push $REMOTE_NAME $BRANCH_NAME

LINES=$(git diff --shortstat HEAD^ | awk '{print $4+$6}')
echo "- Se modificaron $LINES lineas el $(date)" >> README.md
fi
