#!/bin/bash
location="${BASH_SOURCE%/*}"
source $location/setup.sh
symlink-compose-override development
routine-checks
echo "Development mode configured! You can start with docker-compose up -d"
