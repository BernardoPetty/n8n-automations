# Comece com a imagem oficial do n8n como base
FROM n8nio/n8n:latest

# Mude para o usuário root para poder instalar pacotes
USER root

# Instale o FFmpeg (e o su-exec, que é necessário para nosso script)
RUN apk add --no-cache ffmpeg su-exec

# Copie nosso script de inicialização para dentro da imagem
COPY --chown=node:node docker-entrypoint.sh /usr/local/bin/

# Dê permissão de execução para o script
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Defina nosso script como o comando de inicialização do container
ENTRYPOINT ["docker-entrypoint.sh"]

# Retorne para o usuário padrão 'node'
USER node
