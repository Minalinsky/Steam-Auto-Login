@echo off

TITLE Select Steam account

taskkill.exe /F /IM steam.exe

cls
echo(
echo(
echo(
echo                                      Select your account
echo                            =======================================
echo(
echo 1) FIRST_STEAM_USERNAME
echo 2) SECOND_STEAM_USERNAME
echo(

CHOICE /M Select /C 12

If Errorlevel 2 Goto 2
If Errorlevel 1 Goto 1

:1
set username=FIRST_STEAM_USERNAME
Goto end

:2
set username=SECOND_STEAM_USERNAME
Goto end

:end

reg add "HKCU\Software\Valve\Steam" /v AutoLoginUser /t REG_SZ /d %username% /f
reg add "HKCU\Software\Valve\Steam" /v RememberPassword /t REG_DWORD /d 1 /f
start steam://open/main

exit
