#!/bin/bash

DEPLOY_PATH="/srv/www/portfolio"

# Check to make sure things have been setup properly on the server
if ! [ -x "$(command -v hugo)" ]; then
	echo 'Error: hugo is not installed.' >&2
	exit 1
fi

if [ ! -d "$DEPLOY_PATH" ]; then
  echo "Error: /srv/www/portfolio has not been created."
  exit 1
fi

# Compile if all error checks have passed
hugo

# Deploy web site to srv location
cp -R public/* $DEPLOY_PATH