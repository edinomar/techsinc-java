@echo off
:menu
cls
echo ====================================
echo    TECHSYNC - MENU DEPLOY
echo ====================================
echo.
echo 1. Deploy completo (commit + push + servidor)
echo 2. Apenas commit + push (GitHub)
echo 3. Apenas deploy no servidor
echo 4. Ver status do container
echo 5. Sair
echo.
set /p opcao="Escolha uma opcao: "

if "%opcao%"=="1" goto deploy_completo
if "%opcao%"=="2" goto apenas_github
if "%opcao%"=="3" goto apenas_servidor
if "%opcao%"=="4" goto status
if "%opcao%"=="5" exit

:deploy_completo
cd /d C:\Users\edino\Desktop\techsync
git add .
set /p msg="Mensagem do commit: "
git commit -m "%msg%"
git push origin main
ssh -i C:\Users\edino\Documents\key-vm\ssh-key-2026-02-07-java.key ubuntu@164.152.43.101 "~/deploy-git.sh"
pause
goto menu

:apenas_github
cd /d C:\Users\edino\Desktop\techsync
git add .
set /p msg="Mensagem do commit: "
git commit -m "%msg%"
git push origin main
pause
goto menu

:apenas_servidor
ssh -i C:\Users\edino\Documents\key-vm\ssh-key-2026-07-java.key ubuntu@164.152.43.101 "~/deploy-git.sh"
pause
goto menu

:status
ssh -i C:\Users\edino\Documents\key-vm\ssh-key-2026-02-07-java.key ubuntu@164.152.43.101 "docker ps && docker logs --tail 20 spring-app"
pause
goto menu