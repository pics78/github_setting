#!/bin/bash

if [ -n "$1" ]; then
	new_repository=$1
	if [ -e $new_repository ]; then
		echo "ERROR: $new_repository directory already exists."
	else
		git_url="https://github.com/pics78/$new_repository.git"
		git clone $git_url
		echo "OK: cloning git repository"

		sed -e "s/{repository_name}/$new_repository/" config_temp > $new_repository/.git/config
		echo "OK: setting config"
		echo "done"
	fi
else
	echo "ERROR: required to input a new repository name as an argument."
	echo "Usage: $0 {new_repository_name}"
fi
