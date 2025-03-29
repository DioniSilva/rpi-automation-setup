@echo off
setlocal

echo Verificando container RTSP...
docker start rtsp-server >nul 2>&1

echo Iniciando stream da webcam para o Frigate...
start "Webcam RTSP Stream" cmd /c ^
ffmpeg -f dshow -i video="Microsoft® LifeCam HD-3000" -f rtsp -rtsp_transport tcp rtsp://localhost:8554/cam

echo Stream iniciado. Feche a janela do FFmpeg para encerrar manualmente.
pause