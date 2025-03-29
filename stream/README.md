# Webcam USB como RTSP Stream para Frigate no Windows

Este projeto permite transformar uma webcam USB conectada ao seu PC com Windows em um stream RTSP, usando FFmpeg e RTSP Simple Server, para integração com o Frigate.

---

## ✅ Visão Geral

- Captura da câmera USB via **FFmpeg**
- Publicação do stream via **RTSP Simple Server (Docker)**
- Consumo do stream pelo **Frigate (Docker)**
- Automação via scripts `.bat` para **iniciar** e **parar** a transmissão

---

## 🧱 Requisitos

- Windows com Docker e Docker Compose instalados
- FFmpeg instalado (`winget install ffmpeg` ou manualmente)
- Nome da sua webcam (ex: `Microsoft® LifeCam HD-3000`)
- RTSP Simple Server rodando via Docker
- Frigate configurado para consumir o RTSP

---

## ▶️ Como usar

### 1. Subir o RTSP Simple Server (se ainda não estiver rodando)

```bash
docker run -d --name rtsp-server -p 8554:8554 aler9/rtsp-simple-server
```

---

### 2. Rodar o script de transmissão

**start_webcam_stream.bat**

```bat
@echo off
setlocal

echo Verificando container RTSP...
docker start rtsp-server >nul 2>&1

echo Iniciando stream da webcam para o Frigate...
start "Webcam RTSP Stream" cmd /c ^
ffmpeg -f dshow -i video="Microsoft® LifeCam HD-3000" -f rtsp -rtsp_transport tcp rtsp://localhost:8554/cam

echo Stream iniciado. Feche a janela do FFmpeg para encerrar manualmente.
pause
```

---

### 3. Encerrar a transmissão

**stop_webcam_stream.bat**

```bat
@echo off
echo Encerrando stream da webcam (FFmpeg)...
taskkill /IM ffmpeg.exe /F >nul 2>&1

if %errorlevel%==0 (
    echo Stream encerrado com sucesso.
) else (
    echo Nenhum processo FFmpeg encontrado.
)
pause
```

---

### (Opcional) Iniciar com o Windows

1. Pressione `Win + R` e digite `shell:startup`
2. Copie o `start_webcam_stream.bat` para essa pasta

---

## 🔗 Exemplo de config no Frigate

```yaml
cameras:
  usb_camera:
    ffmpeg:
      inputs:
        - path: rtsp://host.docker.internal:8554/cam
          roles:
            - detect
    detect:
      width: 640
      height: 480
      fps: 5
```

---

## 🧠 Dica

Use o comando abaixo para listar o nome correto da sua câmera:

```bash
ffmpeg -list_devices true -f dshow -i dummy
```

---

## License

MIT — use à vontade!
