#! /bin/bash

# Check to make sure Jackett is running

QBTNX=$(pgrep jackett | wc -l )
if [[ ${QBTNX} -ne 1 ]]
then
	echo "Jackett process not running"
	exit 1
fi

echo "Jackett is running"

exit 0
