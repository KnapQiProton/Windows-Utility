@echo off
title KNAPQI MULTIVERSE INTERFACE - STABLE V12.1
mode con: cols=80 lines=40

:: ========================================================================
:: CONFIGURATION
:: ========================================================================
set "version=12.1"
set "webhook_url=https://discord.com/api/webhooks/1455213173882753097/XihcbnWOY33qenhS-PW94Ibfkye9G-uBArL2CsiLUBmXG5gOF_zjq61nIEj7pc27yisq"
set "update_url=https://raw.githubusercontent.com/KnapQiProton/Windows-Utility/refs/heads/main/KnapQi-Utility-App.bat"

:main_menu
cls
color 0b
echo ========================================================================
echo             IDENTIFIED: KnapQi ^| VERSION: %version%
echo ========================================================================
echo.
echo    [1]  CRACK FILE (Software Web)
echo    [2]  CRACK GAME (Gaming Web)
echo    [3]  SYSTEM ACTIVATION (Direct Command)
echo    [4]  DOWNLOAD WINDOWS ISO (Web)
echo    [5]  BOOTABLE TOOLS (Direct Download)
echo    [6]  PRIVACY TOOLS (Direct Download)
echo    [7]  WINDOWS UTILITY (Direct Download)
echo    [8]  SEARCH ENGINE
echo.
echo ---------------------------- SYSTEM OWNER ------------------------------
echo.
echo    [9]  ABOUT OWNER ^& FEEDBACK
echo    [10] CHECK FOR UPDATES (GitHub Sync)
echo    [11] EXIT SYSTEM
echo.
echo ========================================================================
set /p "main_choice=[?] SELECT CATEGORY: "

if "%main_choice%"=="1" goto cat_file
if "%main_choice%"=="2" goto cat_game
if "%main_choice%"=="3" goto cat_activation
if "%main_choice%"=="4" goto cat_iso
if "%main_choice%"=="5" goto cat_burner_direct
if "%main_choice%"=="6" goto cat_privacy
if "%main_choice%"=="7" goto cat_utility
if "%main_choice%"=="8" goto cat_search
if "%main_choice%"=="9" goto about_owner
if "%main_choice%"=="10" goto update_system
if "%main_choice%"=="11" exit
goto main_menu

:: ========================================================================
:: [1] SUB-MENU: CRACK FILE
:: ========================================================================
:cat_file
cls
color 03
echo ========================================================================
echo    CATEGORY: CRACK FILE
echo ========================================================================
echo.
echo    [1] 4download.net
echo    [2] Yasir252.com
echo    [3] [BACK TO MAIN MENU]
echo.
set /p "fc=[?] SELECT TARGET: "
if "%fc%"=="1" start "" "https://4download.net/" & goto cat_file
if "%fc%"=="2" start "" "https://www.yasir252.com/" & goto cat_file
if "%fc%"=="3" goto main_menu
goto cat_file

:: ========================================================================
:: [2] SUB-MENU: CRACK GAME
:: ========================================================================
:cat_game
cls
color 0c
echo ========================================================================
echo    CATEGORY: CRACK GAME
echo ========================================================================
echo.
echo    [1] SteamRIP.com
echo    [2] SteamUnlocked.net
echo    [3] [BACK TO MAIN MENU]
echo.
set /p "gc=[?] SELECT TARGET: "
if "%gc%"=="1" start "" "https://steamrip.com/" & goto cat_game
if "%gc%"=="2" start "" "https://steamunlocked.net/" & goto cat_game
if "%gc%"=="3" goto main_menu
goto cat_game

:: ========================================================================
:: [3] SUB-MENU: SYSTEM ACTIVATION
:: ========================================================================
:cat_activation
cls
color 0a
echo ========================================================================
echo    CATEGORY: SYSTEM ACTIVATION
echo ========================================================================
echo.
echo    [1] RUN MAS (Online Activation)
echo    [2] [BACK TO MAIN MENU]
echo.
set /p "ac=[?] SELECT ACTION: "
if "%ac%"=="1" powershell -Command "irm https://get.activated.win | iex" & pause & goto cat_activation
if "%ac%"=="2" goto main_menu
goto cat_activation

:: ========================================================================
:: [4] SUB-MENU: DOWNLOAD ISO
:: ========================================================================
:cat_iso
cls
color 09
echo ========================================================================
echo    CATEGORY: WINDOWS ISO
echo ========================================================================
echo.
echo    [1] Open Massgrave Genuine Media
echo    [2] [BACK TO MAIN MENU]
echo.
set /p "ic=[?] SELECT ACTION: "
if "%ic%"=="1" start "" "https://massgrave.dev/genuine-installation-media" & goto cat_iso
if "%ic%"=="2" goto main_menu
goto cat_iso

:: ========================================================================
:: [5] SUB-MENU: BOOTABLE TOOLS
:: ========================================================================
:cat_burner_direct
cls
color 0b
echo ========================================================================
echo    CATEGORY: BOOTABLE TOOLS - DIRECT DOWNLOAD
echo ========================================================================
echo.
echo    [1] DOWNLOAD RUFUS
echo    [2] DOWNLOAD VENTOY
echo    [3] DOWNLOAD BALENA ETCHER
echo    [4] [BACK TO MAIN MENU]
echo.
set /p "bc=[?] SELECT TOOL: "
if "%bc%"=="1" curl -L -o "rufus.exe" "https://github.com/pbatard/rufus/releases/download/v4.4/rufus-4.4p.exe" & pause & goto cat_burner_direct
if "%bc%"=="2" curl -L -o "ventoy.zip" "https://github.com/ventoy/Ventoy/releases/download/v1.0.99/ventoy-1.0.99-windows.zip" & pause & goto cat_burner_direct
if "%bc%"=="3" curl -L -o "balena.exe" "https://github.com/balena-io/etcher/releases/download/v1.18.11/balenaEtcher-Portable-1.18.11.exe" & pause & goto cat_burner_direct
if "%bc%"=="4" goto main_menu
goto cat_burner_direct

:: ========================================================================
:: [6] SUB-MENU: PRIVACY TOOLS
:: ========================================================================
:cat_privacy
cls
color 0b
echo ========================================================================
echo    CATEGORY: PRIVACY TOOLS - DIRECT DOWNLOAD
echo ========================================================================
echo.
echo    [1] DOWNLOAD LIBREWOLF
echo    [2] DOWNLOAD OPENVPN
echo    [3] [BACK TO MAIN MENU]
echo.
set /p "pc=[?] SELECT TOOL: "
if "%pc%"=="1" curl -L -o "librewolf_setup.exe" "https://gitlab.com/api/v4/projects/24386000/packages/generic/librewolf/124.0.1-1/librewolf-124.0.1-1-windows-x86_64-setup.exe" & pause & goto cat_privacy
if "%pc%"=="2" curl -L -o "openvpn_setup.msi" "https://swupdate.openvpn.org/community/releases/OpenVPN-2.6.9-I001-amd64.msi" & pause & goto cat_privacy
if "%pc%"=="3" goto main_menu
goto cat_privacy

:: ========================================================================
:: [7] SUB-MENU: WINDOWS UTILITY
:: ========================================================================
:cat_utility
cls
color 0b
echo ========================================================================
echo    CATEGORY: WINDOWS UTILITY - DIRECT DOWNLOAD
echo ========================================================================
echo.
echo    [1] DOWNLOAD CPU-Z (Portable ZIP)
echo    [2] [BACK TO MAIN MENU]
echo.
set /p "uc=[?] SELECT TOOL: "
if "%uc%"=="1" curl -L -o "cpuz.zip" "https://download.cpuid.com/cpu-z/cpu-z_2.09-en.zip" & pause & goto cat_utility
if "%uc%"=="2" goto main_menu
goto cat_utility

:: ========================================================================
:: [8] SUB-MENU: SEARCH ENGINE
:: ========================================================================
:cat_search
cls
color 0e
echo ========================================================================
echo    CATEGORY: SEARCH ENGINE
echo ========================================================================
echo.
echo    [1] Google
echo    [2] DuckDuckGo
echo    [3] [BACK TO MAIN MENU]
echo.
set /p "sc=[?] SELECT TARGET: "
if "%sc%"=="1" start "" "https://www.google.com" & goto cat_search
if "%sc%"=="2" start "" "https://duckduckgo.com" & goto cat_search
if "%sc%"=="3" goto main_menu
goto cat_search

:: ========================================================================
:: [9] ABOUT OWNER ^& FEEDBACK
:: ========================================================================
:about_owner
cls
color 0d
echo ========================================================================
echo                      SYSTEM OWNER INFORMATION
echo ========================================================================
echo.
echo    IDENTITITY : KnapQi
echo    ROLE       : System Architect ^| Multiverse Dev
echo    VERSION    : %version%
echo.
echo    "Too perfect to be controlled, too broken to be fixed."
echo.
echo ========================================================================
echo    [F] GIVE FEEDBACK (Direct to Discord)
echo    [M] BACK TO MENU
echo ========================================================================
set /p "oc=[?] INPUT: "
if /i "%oc%"=="f" goto send_feedback
if /i "%oc%"=="m" goto main_menu
goto about_owner

:send_feedback
cls
color 0e
echo [ TULIS FEEDBACK LU BUAT KnapQi ]
echo.
set /p "user_msg=Pesan: "
if "%user_msg%"=="" goto about_owner
echo.
echo [+] Sending to Discord...
powershell -Command "$msg = '**Feedback from %USERNAME%**\n%user_msg%'; $payload = @{content = $msg}; Invoke-RestMethod -Uri '%webhook_url%' -Method Post -Body ($payload | ConvertTo-Json) -ContentType 'application/json'"
pause
goto about_owner

:: ========================================================================
:: [10] UPDATE SYSTEM LOGIC (FIXED)
:: ========================================================================
:update_system
cls
color 0e
echo ========================================================================
echo                       SYSTEM UPDATE MANAGER
echo ========================================================================
echo.
echo [+] Connecting to KnapQi GitHub Repository...
echo [+] Current Version: %version%
echo.
curl -L -s -o "Update_Temp.bat" "%update_url%"
if exist "Update_Temp.bat" (
    echo [+] Update file found!
    echo [+] Patching system...
    echo [+] Interface will restart in 3 seconds.
    timeout /t 3 > nul
    :: Perbaikan kutip untuk handle spasi di path user
    start /b "" cmd /c "timeout /t 1 & move /y Update_Temp.bat ""%~f0"" & start "" ""%~f0"""
    exit
) else (
    echo [-] ERROR: Gagal mendapatkan file update.
    pause
    goto main_menu
)
