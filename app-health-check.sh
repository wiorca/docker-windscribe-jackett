#! /bin/bash

# Check to make sure qbittorrent-nox is running

QBTNX=$(pgrep jackett | wc -l )
if [[ ${QBTNX} -ne 2 ]]
then
	echo "Jackett process not running"
	exit 1
fi

echo "Jackett is running"

exit 0

