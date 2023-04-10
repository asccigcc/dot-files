#!/bin/bash
#
# This script Install Docker inside the current path

# usage:

## dockerize [ACTION] [OPTIONS]

action=$1
lang=$2

if [ -n "$action" ]; then
  case "$action" in
    list)
      # List the supported containers
      ;;
    install)
      # Install and dockerize the application
      ;;
    *)
      echo "No action named $action"
      ;;
  esac
else
  echo "No action given use help for more information"
fi

# echo "Do you want to Dockerize this directory? [Y/n]"
# read answer

# if [[ "$answer" == "Y" || "$answer" == "y" ]]; then
#   if [ -n "$lang" ]; then
#     echo "Download Docker components"
#     echo "Dockerizing"
#     echo "Finished Dockerization"
#   else
#     echo "No language given"
#   fi
# else
#   echo -n "Bye Bye "
#   echo -e "\xF0\x9F\x91\x8B"
# fi

