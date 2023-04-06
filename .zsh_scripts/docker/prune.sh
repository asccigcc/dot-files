#!/bin/bash
#
# This script prune Docker and save space

echo "Do you want to proceed prune Docker? [Y/n]"
read answer

if [[ "$answer" == "Y" || "$answer" == "y" ]]; then
  echo "docker prune starting"

  docker builder prune -f
  docker system prune --volumes -f

  echo "Docker prune complete."
else
  echo "Aborting."
fi
