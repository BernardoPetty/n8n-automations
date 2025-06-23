#!/bin/sh

# Garante que o script pare se algum comando falhar
set -e

# 1. Muda a propriedade da pasta .n8n para o usuário 'node'
# O -R significa 'recursivo', aplicando a todos os arquivos dentro
chown -R node:node /home/node/.n8n

# 2. Executa o comando original do n8n como o usuário 'node'
# O su-exec é uma ferramenta leve que troca de usuário antes de rodar um comando
exec su-exec node n8n start
