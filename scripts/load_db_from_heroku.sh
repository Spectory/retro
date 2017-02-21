#!/bin/bash

# Exit if any subcommand fails
set -e
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NO_COLOR='\033[0m'

printf "${YELLOW} ******************************\n"
printf "Make sure local db is not accessed by any thing (mix server, mix console, pgadmin3...)\n"
printf "${YELLOW} ******************************${NO_COLOR}\n"

if [ "$1" = "" ]
then
  printf "${RED}No remote name given. view avaiable remotes by running 'git remote'${NO_COLOR}\n"
  exit
fi

printf "${GREEN} dropping local db${NO_COLOR}\n"
echo "dropping local db"
rake db:drop
rake db:create

if [ "$2" = "capture" ]
then
  printf "${GREEN}capturing new db backup ($1)${NO_COLOR}\n"
  heroku pg:backups:capture -r $1
fi

printf "${GREEN}Downloading backup${NO_COLOR}\n"
curl -o /tmp/latest.dump `heroku pg:backups:public-url -r $1`

printf "${GREEN}loading backup into localhost (db is retro_development)${NO_COLOR}\n"
pg_restore --verbose --clean --no-acl --no-owner -h localhost -U postgres -d retro_development /tmp/latest.dump
