@echo off
:: Solicita privilegios de Administrador (necessario para comandos SFC, DISM, Prefetch, etc.)
net session >nul 2>&1
if %errorLevel% neq 0 (
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

echo ===================================================
echo      INICIANDO FERRAMENTA DE LIMPEZA E REPARO
echo ===================================================
echo.

echo [1/7] Limpando a pasta Prefetch...
del /q /f /s "C:\Windows\Prefetch\*.*" >nul 2>&1
for /d %%i in ("C:\Windows\Prefetch\*") do rmdir /q /s "%%i" >nul 2>&1

echo [2/7] Limpando a pasta Recent (Arquivos recentes)...
del /q /f /s "%userprofile%\Recent\*.*" >nul 2>&1

echo [3/7] Limpando a pasta Temp do Sistema...
del /q /f /s "C:\Windows\Temp\*.*" >nul 2>&1
for /d %%i in ("C:\Windows\Temp\*") do rmdir /q /s "%%i" >nul 2>&1

echo [4/7] Limpando a pasta %%temp%% do Usuario...
del /q /f /s "%temp%\*.*" >nul 2>&1
for /d %%i in ("%temp%\*") do rmdir /q /s "%%i" >nul 2>&1

echo [5/7] Executando a Limpeza de Disco (Cleanmgr)...
cleanmgr /sagerun:1

echo [6/7] Verificando integridade dos arquivos (SFC /scannow)...
echo Este processo pode demorar alguns minutos...
sfc /scannow

echo [7/7] Reparando a imagem do sistema (DISM)...
echo Este processo pode demorar alguns minutos...
dism /online /cleanup-image /restorehealth

echo.
echo ===================================================
echo      PROCESSO CONCLUIDO COM SUCESSO!
echo ===================================================
pause
