FROM joplin/server:latest

USER root

# Install CA certificates
RUN apt-get update \
  && apt-get install -y --no-install-recommends ca-certificates \
  && update-ca-certificates \
  && rm -rf /var/lib/apt/lists/*

# Fix pm2 log dir permissions (Joplin uses pm2 and writes to /opt/pm2)
RUN mkdir -p /opt/pm2 \
  && chown -R node:node /opt/pm2

USER node
