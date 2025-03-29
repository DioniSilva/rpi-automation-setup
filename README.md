# Raspberry Pi Automation Setup

Este repositório contém os arquivos de instalação e configuração do seu Raspberry Pi 3 Model B para funcionar como central de automação residencial usando Docker e Home Assistant.

## 📦 O que está incluído

- `setup_raspberry.sh`: script de pós-instalação que atualiza o sistema, instala Docker, Docker Compose e Tailscale.
- `docker-compose.yml`: arquivos para rodar o Home Assistant e o Frigate em containers Docker.
- `frigate/config/config.yml`: arquivo de configuração do Frigate (sem MQTT).

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

3. Suba os containers:

```bash
docker compose up -d
```

4. Acesse:
- Home Assistant: `http://<ip-do-raspberry>:8123`
- Frigate: `http://<ip-do-raspberry>:5000`

## 📂 Estrutura de pastas

```
rpi-automation-setup/
├── README.md
├── docker-compose.yml
├── setup_raspberry.sh
└── frigate/
    └── config/
        └── config.yml
```

---

Feito com ❤️ por Dioni
