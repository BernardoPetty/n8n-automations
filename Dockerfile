# Dockerfile Definitivo para n8n + FFmpeg no Railway

# 1. Começa com a imagem oficial do n8n como base
FROM n8nio/n8n:latest

# 2. Muda para o usuário root para ter permissão de instalar pacotes
USER root

# 3. Instala o FFmpeg usando o gerenciador de pacotes do sistema
RUN apk add --no-cache ffmpeg

# 4. Muda de volta para o usuário 'node', que é o usuário padrão e seguro do n8n
USER node

# 5. Define o comando de inicialização. Esta é a parte mais CRÍTICA.
#    Ela força a correção das permissões na pasta de dados ANTES de iniciar o n8n.
#    Isso resolve o erro "EACCES: permission denied".
ENTRYPOINT ["sh", "-c", "chown -R node:node /home/node/.n8n && exec n8n start"]
