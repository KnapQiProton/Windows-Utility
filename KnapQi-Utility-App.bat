@echo off
title KNAPQI MULTIVERSE INTERFACE - VERSION CONTROL V13.2
mode con: cols=85 lines=45

:: ========================================================================
:: CONFIGURATION
:: ========================================================================
set "version=13.2"
set "keepLanguage=en-US"
set "webhook_url=https://discord.com/api/webhooks/1455213173882753097/XihcbnWOY33qenhS-PW94Ibfkye9G-uBArL2CsiLUBmXG5gOF_zjq61nIEj7pc27yisq"
set "update_url=https://raw.githubusercontent.com/KnapQiProton/Windows-Utility/refs/heads/main/KnapQi-Utility-App.bat"
set "github_url=https://github.com/KnapQiProton/Windows-Utility"
set "hellzerg_url=https://github.com/hellzerg/optimizer/releases/latest/download/Optimizer-16.7.exe"

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
echo    [9]  APP OPTIMIZER (Discord ^& Hellzerg)
echo.
echo ---------------------------- SYSTEM OWNER ------------------------------
echo.
echo    [10] ABOUT OWNER ^& FEEDBACK
echo    [11] VIEW SOURCE / GITHUB
echo    [12] CHECK FOR UPDATES
echo    [13] EXIT SYSTEM
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
if "%main_choice%"=="9" goto cat_optimizer
if "%main_choice%"=="10" goto about_owner
if "%main_choice%"=="11" start "" "%github_url%" & goto main_menu
if "%main_choice%"=="12" goto update_system
if "%main_choice%"=="13" exit
goto main_menu

:: ========================================================================
:: [1] CRACK FILE
:: ========================================================================
:cat_file
cls
color 03
echo [ CATEGORY: CRACK FILE ]
echo.
echo    [1] 4download.net
echo    [2] Yasir252.com
echo    [3] BACK TO MAIN MENU
echo.
set /p "fc=[?] SELECT: "
if "%fc%"=="1" start "" "https://4download.net/" & goto cat_file
if "%fc%"=="2" start "" "https://www.yasir252.com/" & goto cat_file
if "%fc%"=="3" goto main_menu
goto cat_file

:: ========================================================================
:: [2] CRACK GAME
:: ========================================================================
:cat_game
cls
color 0c
echo [ CATEGORY: CRACK GAME ]
echo.
echo    [1] SteamRIP.com
echo    [2] SteamUnlocked.net
echo    [3] BACK TO MAIN MENU
echo.
set /p "gc=[?] SELECT: "
if "%gc%"=="1" start "" "https://steamrip.com/" & goto cat_game
if "%gc%"=="2" start "" "https://steamunlocked.net/" & goto cat_game
if "%gc%"=="3" goto main_menu
goto cat_game

:: ========================================================================
:: [9] APP OPTIMIZER
:: ========================================================================
:cat_optimizer
cls
color 09
echo [ CATEGORY: APP OPTIMIZER ]
echo.
echo    [1] DISCORD OPTIMIZER (Full Suite)
echo    [2] DOWNLOAD OPTIMIZER HELLZERG
echo    [3] BACK TO MAIN MENU
echo.
set /p "opt_choice=[?] SELECT OPTION: "
if "%opt_choice%"=="1" goto discord_init
if "%opt_choice%"=="2" goto download_hellzerg
if "%opt_choice%"=="3" goto main_menu
goto cat_optimizer

:download_hellzerg
cls
echo [+] Connecting to GitHub...
curl -L -o "Optimizer-Hellzerg.exe" "%hellzerg_url%"
if exist "Optimizer-Hellzerg.exe" (
    echo [+] Download Selesai! Menjalankan...
    start "" "Optimizer-Hellzerg.exe"
) else (
    echo [!] Gagal download.
)
pause
goto cat_optimizer

:discord_init
cls
setlocal enabledelayedexpansion
set /a startver=0
cd /d "%appdata%"
echo [+] Mencari versi Discord...
for /f "delims=" %%a in ('dir /b "Discord*"') do (
    set /a startver+=1
    set "version_list[!startver!]=%%a"
    echo    [!startver!] %%a
)
if !startver!==0 (echo [!] Discord tidak ditemukan. & pause & endlocal & goto cat_optimizer)
echo.
set /p "vernum=[?] Pilih Nomor: "
set "selected_discord=!version_list[%vernum%]!"
set "discord_local_dir=%localappdata%\!selected_discord!"
set "discord_roaming_dir=%appdata%\!selected_discord!"

:discord_menu
cls
echo [ DISCORD OPTIMIZER - !selected_discord! ]
echo.
echo    [1] Debloat Modules
echo    [2] Clear Languages
echo    [3] Clear Logs ^& Crash Reports
echo    [4] Optimize CPU Priority
echo    [5] Clear Old Versions
echo    [6] Clear Cache
echo    [7] Disable Start-Up
echo    [8] Restart Discord
echo    [9] BACK TO OPTIMIZER MENU
echo.
set /p "num=[?] PILIHAN: "

if "%num%"=="1" (
    taskkill /F /IM "!selected_discord!.exe" /T >nul 2>&1
    for /f "delims=" %%a in ('dir /b "!discord_local_dir!\app-*"') do (
        set "app_ver_dir=!discord_local_dir!\%%a\modules"
        if exist "!app_ver_dir!" (
            cd /d "!app_ver_dir!"
            for /f "delims=" %%m in ('dir /b') do (
                echo(%%m|findstr "discord_desktop_core-* discord_modules-* discord_utils-* discord_voice-*" >nul || (
                    rd /s /q "%%m" >nul 2>&1
                )
            )
        )
    )
    echo [+] Selesai. & pause & goto discord_menu
)
if "%num%"=="4" goto discord_priority
if "%num%"=="9" (endlocal & goto cat_optimizer)
:: (Logika 2,3,5,6,7,8 sama seperti sebelumnya, hanya layout echo yang dipastikan turun)
goto discord_menu

:discord_priority
cls
echo [ SET CPU PRIORITY ]
echo.
echo    [1] High
echo    [2] Low
echo    [3] Normal
echo    [4] BACK
echo.
set /p "prio=[?] PILIHAN: "
if "%prio%"=="1" reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\!selected_discord!.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 3 /f >nul 2>&1
if "%prio%"=="2" reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\!selected_discord!.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 1 /f >nul 2>&1
if "%prio%"=="3" reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\!selected_discord!.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 2 /f >nul 2>&1
goto discord_menu

:: ========================================================================
:: [5] BOOTABLE TOOLS
:: ========================================================================
:cat_burner_direct
cls
color 0b
echo [ CATEGORY: BOOTABLE TOOLS ]
echo.
echo    [1] DOWNLOAD RUFUS
echo    [2] DOWNLOAD VENTOY
echo    [3] BACK TO MAIN MENU
echo.
set /p "bc=[?] SELECT: "
if "%bc%"=="1" curl -L -o "rufus.exe" "https://github.com/pbatard/rufus/releases/download/v4.4/rufus-4.4p.exe" & pause & goto cat_burner_direct
if "%bc%"=="2" curl -L -o "ventoy.zip" "https://github.com/ventoy/Ventoy/releases/download/v1.0.99/ventoy-1.0.99-windows.zip" & pause & goto cat_burner_direct
if "%bc%"=="3" goto main_menu
goto cat_burner_direct

:: ========================================================================
:: OTHER SECTIONS (KE BAWAH SEMUA)
:: ========================================================================
:cat_activation
cls
echo [ SYSTEM ACTIVATION ]
echo    [1] RUN MAS (Online)
echo    [2] BACK
set /p "ac=:"
if "%ac%"=="1" powershell -Command "irm https://get.activated.win | iex" & pause
goto main_menu

:cat_iso
cls
start "" "https://massgrave.dev/genuine-installation-media" & goto main_menu

:cat_search
cls
echo [ SEARCH ENGINE ]
echo    [1] Google
echo    [2] DuckDuckGo
echo    [3] BACK
set /p "sc=:"
if "%sc%"=="1" start "" "https://www.google.com" & goto cat_search
if "%sc%"=="2" start "" "https://duckduckgo.com" & goto cat_search
goto main_menu

:update_system
cls
echo [+] Connecting to Update Server...
curl -L -s -o "KnapQi-Updated-Version.bat" "%update_url%"
if exist "KnapQi-Updated-Version.bat" (
    start /b "" cmd /c "ping 127.0.0.1 -n 2 > nul & ren ""%~nx0"" ""Legacy-Version.old"" & start KnapQi-Updated-Version.bat"
    exit
) else (pause & goto main_menu)

:about_owner
cls
color 0d
echo ========================================================================
echo                      SYSTEM OWNER INFORMATION
echo ========================================================================
echo.
echo    DEVELOPER : KnapQi
echo    VERSION   : %version%
echo.
echo    [F] GIVE FEEDBACK
echo    [M] BACK TO MENU
echo.
set /p "oc=:"
if /i "%oc%"=="f" goto send_feedback
if /i "%oc%"=="m" goto main_menu
goto about_owner

:send_feedback
cls
set /p "user_msg=Pesan: "
if "%user_msg%"=="" goto about_owner
powershell -Command "$msg = '**Feedback from %USERNAME%**\n%user_msg%'; $payload = @{content = $msg}; Invoke-RestMethod -Uri '%webhook_url%' -Method Post -Body ($payload | ConvertTo-Json) -ContentType 'application/json'" >nul 2>&1
echo [+] PESAN TERKIRIM! & pause & goto about_owner
