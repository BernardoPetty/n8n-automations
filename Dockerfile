# Dockerfile Final

# Comece com a imagem oficial do n8n como base
FROM n8nio/n8n:latest

# Mude para o usuário root para poder instalar pacotes
USER root

# Instale o FFmpeg
RUN apk add --no-cache ffmpeg

# Retorne para o usuário padrão 'node' para o contexto da aplicação
USER node

# Comando de inicialização que resolve o problema de permissão
# Esta é a linha mais importante
CMD ["sh", "-c", "chown -R node:node /home/node/.n8n && n8n start --tunnel"]
