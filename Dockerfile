# Dockerfile Final Definitivo - v5

# 1. Começa com a imagem oficial do n8n
FROM n8nio/n8n:latest

# 2. Muda para o usuário root para instalar o ffmpeg
#    E O MAIS IMPORTANTE: NÃO VOLTA MAIS para o usuário 'node'.
#    O restante do processo será executado como root.
USER root

# 3. Instala o FFmpeg
RUN apk add --no-cache ffmpeg
