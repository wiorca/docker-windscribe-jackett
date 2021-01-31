#! /bin/bash

for count in {1..1000}; do
	DOWNLOAD_URL=$(curl -s https://api.github.com/repos/Jackett/Jackett/releases | grep Jackett.Binaries.LinuxAMDx64.tar.gz | grep browser_download_url | head -1 | cut -d \" -f 4 | grep tar)
	if [[ $DOWNLOAD_URL == "" ]]; then
		echo "Request attempt $count returned bad value: \"$DOWNLOAD_URL\""
		sleep 1
	else
		echo "Request attempt $count returned good value: $DOWNLOAD_URL"
		curl -L $DOWNLOAD_URL | tar xvz --directory /opt
		exit 0
	fi
done

exit -1

