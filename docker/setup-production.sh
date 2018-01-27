#!/bin/bash
# USAGE: docker/setup-production-primary.sh
location="${BASH_SOURCE%/*}"
source $location/setup.sh

echo "Is this a primary or secondary production server?"
select server in "primary" "secondary"; do
    case $server in
        primary ) symlink-compose-override production.primary; break;;
        secondary ) symlink-compose-override production.secondary; break;;
    esac
done

routine-checks
echo "Production mode configured! You can start with docker-compose up -d"

[[ $server = "primary" ]] \
  && echo "Don't forget to copy db/acorn to /etc/cron.d" \
  && echo "Cmd [as root] is: cp /app/acorn/db/acorn /etc/cron.d/"
