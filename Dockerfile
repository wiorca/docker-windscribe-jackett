
# Based on wiorca/docker-windscribe-mono
FROM wiorca/docker-windscribe-mono:latest

# Version
ARG VERSION=0.0.4

# Expose the webadmin port for Jackett
EXPOSE 9117/tcp

# Create a volume for the bittorrent data
VOLUME [ "/data" ]

# Add in scripts for health check and start-up
ADD app-health-check.sh /opt/scripts/app-health-check.sh
ADD app-startup.sh /opt/scripts/app-startup.sh
ADD app-setup.sh /opt/scripts/app-setup.sh

# Install Jackett
RUN curl -L $( curl -s https://api.github.com/repos/Jackett/Jackett/releases | grep Jackett.Binaries.LinuxAMDx64.tar.gz | grep browser_download_url | head -1 | cut -d \" -f 4 ) \
    | tar xvz --directory /opt

