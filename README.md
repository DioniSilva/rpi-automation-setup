# Raspberry Pi Automation Setup

Este repositório contém os arquivos de instalação e configuração do seu Raspberry Pi 3 Model B para funcionar como central de automação residencial usando Docker e Home Assistant.

## 📦 O que está incluído

- `setup_raspberry.sh`: script de pós-instalação que atualiza o sistema, instala Docker, Docker Compose e Tailscale.
- `docker-compose.yml`: arquivo para rodar o Home Assistant em container Docker.
- Estrutura pronta para você expandir com novos serviços (Node-RED, MQTT, Frigate, etc).

## 🚀 Como usar

1. Clone o repositório no seu Raspberry Pi:

```bash
git clone https://github.com/seu-usuario/rpi-automation-setup.git
cd rpi-automation-setup
```

2. Torne o script executável e execute:

```bash
chmod +x setup_raspberry.sh
./setup_raspberry.sh
```

3. Acesse o Home Assistant em `http://<ip-do-raspberry>:8123`

## 💡 Requisitos

- Raspberry Pi OS Lite (Bullseye ou mais recente)
- Docker instalado (ou rodar o script `setup_raspberry.sh`)
- Conexão com a internet

---

Feito com ❤️ por Dioni
