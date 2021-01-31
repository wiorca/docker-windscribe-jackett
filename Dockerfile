
# Based on wiorca/docker-windscribe-mono
FROM wiorca/docker-windscribe-mono:latest

# Version
ARG VERSION=0.0.6

# Expose the webadmin port for Jackett
EXPOSE 9117/tcp

# Create a volume for the bittorrent data
VOLUME [ "/data" ]

# Add in scripts for health check and start-up
ADD getinstaller.sh /opt/scripts/getinstaller.sh
ADD app-health-check.sh /opt/scripts/app-health-check.sh
ADD app-startup.sh /opt/scripts/app-startup.sh
ADD app-setup.sh /opt/scripts/app-setup.sh

# Install Jackett
RUN /opt/scripts/getinstaller.sh

