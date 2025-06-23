# Dockerfile Final para uso com DB
FROM n8nio/n8n:latest
USER root
RUN apk add --no-cache ffmpeg
USER node
