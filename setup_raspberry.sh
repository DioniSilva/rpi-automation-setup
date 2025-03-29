#!/bin/bash

echo "🔄 Atualizando o sistema..."
sudo apt update && sudo apt upgrade -y

echo "🐍 Instalando dependências básicas..."
sudo apt install -y curl git apt-transport-https ca-certificates gnupg lsb-release software-properties-common

echo "🐳 Instalando Docker..."
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
sudo usermod -aG docker $USER

echo "📦 Instalando Docker Compose..."
sudo apt install -y python3-pip
sudo pip3 install docker-compose

echo "🔐 Instalando o Tailscale..."
curl -fsSL https://tailscale.com/install.sh | sh
sudo systemctl enable --now tailscaled

echo "✅ Ativando Docker e Tailscale no boot..."
sudo systemctl enable docker
sudo systemctl enable tailscaled

echo "🐳 Subindo os containers via Docker Compose..."
cd "$(dirname "$0")"
docker compose up -d

echo "🎉 Setup concluído! Acesse o Home Assistant em http://<ip-do-raspberry>:8123"
echo "📹 E o Frigate em http://<ip-do-raspberry>:5000"
