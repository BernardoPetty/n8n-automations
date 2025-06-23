# Dockerfile Final e Consolidado v4

# 1. Começa com a imagem oficial do n8n como base
FROM n8nio/n8n:latest

# 2. Muda para o usuário root para poder instalar o que precisamos
USER root

# 3. Instala o FFmpeg.
RUN apk add --no-cache ffmpeg

# 4. Muda de volta para o usuário 'node'
USER node

# 5. Define o comando de inicialização definitivo.
#    Esta linha é a mais importante:
#    a) Ela força a mudança de dono da pasta /data para o usuário 'node'.
#    b) E SOMENTE DEPOIS, ela inicia o n8n de forma segura.
ENTRYPOINT ["sh", "-c", "chown -R node:node /data && exec n8n start --tunnel"]
