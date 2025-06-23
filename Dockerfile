# Dockerfile

# Comece com a imagem oficial do n8n como base
FROM n8nio/n8n:latest

# Mude para o usuário root para poder instalar pacotes
USER root

# Instale o FFmpeg
RUN apk add --no-cache ffmpeg

# Retorne para o usuário padrão 'node' por segurança
USER node
