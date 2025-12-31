FROM joplin/server:latest

USER root

# CA certs
RUN apt-get update \
  && apt-get install -y --no-install-recommends ca-certificates \
  && update-ca-certificates \
  && rm -rf /var/lib/apt/lists/*

# Fix permissions for runtime writes (pm2 + server logs)
RUN mkdir -p /opt/pm2 \
  && chown -R node:node /opt/pm2 \
  && chown -R node:node /home/joplin

USER node
