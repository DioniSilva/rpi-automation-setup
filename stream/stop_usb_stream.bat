@echo off
echo Encerrando stream da webcam (FFmpeg)...
taskkill /IM ffmpeg.exe /F >nul 2>&1

if %errorlevel%==0 (
    echo Stream encerrado com sucesso.
) else (
    echo Nenhum processo FFmpeg encontrado.
)
pause