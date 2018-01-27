#!/bin/bash
docker network create -d bridge acornnet 2>/dev/null
script_dir="${BASH_SOURCE%/*}" 1>/dev/null || exit 1

symlink-compose-override() {
  pushd "${BASH_SOURCE%/*}" 1>/dev/null || exit 1
  unlink $PWD/../docker-compose.override.yml 2>/dev/null
  ln -s $PWD/overrides/$1.yml $PWD/../docker-compose.override.yml
  popd 1>/dev/null
}

routine-checks() {
  if [[ ! -f $location/../cms/config/database.yml ]]; then
    echo "ERROR: database.yml missing! you need this before the server will start"
    exit 1
  fi
  if [[ ! -f $location/../.env ]]; then
    echo "ERROR: .env file missing! you need this before the server will start"
    exit 1
  fi
}
