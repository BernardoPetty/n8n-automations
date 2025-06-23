# Dockerfile Definitivo v3

# Começa com a imagem oficial do n8n como base
FROM n8nio/n8n:latest

# Mude para o usuário root para poder instalar pacotes
USER root

# Instale o FFmpeg
RUN apk add --no-cache ffmpeg

# --- MUDANÇA IMPORTANTE ABAIXO ---

# Retorna para o usuário padrão 'node'
USER node

# Define o ponto de entrada do container. Este comando é mais poderoso que o CMD.
# Ele força a execução da correção de permissões ANTES de iniciar o n8n.
ENTRYPOINT ["sh", "-c", "chown -R node:node /home/node/.n8n; exec n8n start --tunnel"]
