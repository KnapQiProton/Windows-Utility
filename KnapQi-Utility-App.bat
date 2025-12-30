@echo off
title KNAPQI MULTIVERSE INTERFACE - STABLE VERSION V14.1
mode con: cols=85 lines=45
setlocal EnableDelayedExpansion

:: ========================================================================
:: CONFIGURATION
:: ========================================================================
set "version=14.1"
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
if "%main_choice%"=="4" goto action_iso
if "%main_choice%"=="5" goto cat_burner_direct
if "%main_choice%"=="6" goto cat_privacy
if "%main_choice%"=="7" goto cat_utility
if "%main_choice%"=="8" goto cat_search
if "%main_choice%"=="9" goto cat_optimizer
if "%main_choice%"=="10" goto about_owner
if "%main_choice%"=="11" goto action_github
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
:: [3] SYSTEM ACTIVATION
:: ========================================================================
:cat_activation
cls
color 0a
echo [ CATEGORY: SYSTEM ACTIVATION ]
echo.
echo    [1] RUN MAS (Online Activation)
echo    [2] BACK TO MAIN MENU
echo.
set /p "ac=[?] SELECT: "
if "%ac%"=="1" goto run_mas
if "%ac%"=="2" goto main_menu
goto cat_activation

:run_mas
cls
echo [+] Running MAS...
powershell -Command "irm https://get.activated.win | iex"
pause
goto cat_activation

:: ========================================================================
:: [7] WINDOWS UTILITY (FIXED: LIST MENU)
:: ========================================================================
:cat_utility
cls
color 0b
echo [ CATEGORY: WINDOWS UTILITY ]
echo.
echo    [1] CPU-Z (System Info)
echo    [2] HWMonitor (Hardware Monitor)
echo    [3] BACK TO MAIN MENU
echo.
set /p "uc=[?] SELECT: "
if "%uc%"=="1" goto dl_cpuz
if "%uc%"=="2" goto dl_hwmonitor
if "%uc%"=="3" goto main_menu
goto cat_utility

:dl_cpuz
echo [+] Downloading CPU-Z...
curl -L -o "cpuz.zip" "https://download.cpuid.com/cpu-z/cpu-z_2.09-en.zip"
echo [+] Download Complete.
pause
goto cat_utility

:dl_hwmonitor
echo [+] Downloading HWMonitor...
curl -L -o "hwmonitor.zip" "https://download.cpuid.com/hwmonitor/hwmonitor_1.53.zip"
echo [+] Download Complete.
pause
goto cat_utility

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
set /p "opt_choice=[?] SELECT: "
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
    echo [!] Gagal download. Periksa koneksi.
)
pause
goto cat_optimizer

:discord_init
cls
set /a startver=0
cd /d "%appdata%"
echo [+] Mencari versi Discord...
for /f "delims=" %%a in ('dir /b "Discord*"') do (
    set /a startver+=1
    set "version_list[!startver!]=%%a"
    echo    [!startver!] %%a
)
if !startver!==0 (
    echo [!] Discord tidak ditemukan. 
    pause 
    goto cat_optimizer
)
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

if "%num%"=="1" goto d_debloat
if "%num%"=="2" goto d_langs
if "%num%"=="3" goto d_logs
if "%num%"=="4" goto d_prio
if "%num%"=="5" goto d_oldver
if "%num%"=="6" goto d_cache
if "%num%"=="7" goto d_startup
if "%num%"=="8" goto d_restart
if "%num%"=="9" goto cat_optimizer
goto discord_menu

:: --- DISCORD ACTIONS ---

:d_debloat
echo [+] Debloating...
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
echo [+] Selesai.
pause
goto discord_menu

:d_langs
echo [+] Clearing Languages...
for /f "delims=" %%a in ('dir /b "!discord_local_dir!\app-*"') do (
    set "lang_dir=!discord_local_dir!\%%a\locales"
    if exist "!lang_dir!" (
        cd /d "!lang_dir!"
        for /f "delims=" %%l in ('dir /b') do (
            if not "%%l"=="%keepLanguage%.pak" del /f /q "%%l" >nul 2>&1
        )
    )
)
echo [+] Selesai.
pause
goto discord_menu

:d_logs
echo [+] Cleaning Logs...
del /f /q /s "!discord_local_dir!\*.log" >nul 2>&1
del /f /q "!discord_local_dir!\packages\*.nupkg" >nul 2>&1
del /f /s /q "!discord_roaming_dir!\*.log" >nul 2>&1
echo [+] Selesai.
pause
goto discord_menu

:d_prio
cls
echo [ SET CPU PRIORITY ]
echo.
echo    [1] High Priority
echo    [2] Low Priority
echo    [3] Normal Priority
echo    [4] BACK
echo.
set /p "prio=[?] SELECT: "
if "%prio%"=="1" goto d_prio_high
if "%prio%"=="2" goto d_prio_low
if "%prio%"=="3" goto d_prio_norm
if "%prio%"=="4" goto discord_menu
goto d_prio

:d_prio_high
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\!selected_discord!.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 3 /f >nul 2>&1
echo [+] Set High.
pause
goto discord_menu

:d_prio_low
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\!selected_discord!.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 1 /f >nul 2>&1
echo [+] Set Low.
pause
goto discord_menu

:d_prio_norm
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\!selected_discord!.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 2 /f >nul 2>&1
echo [+] Set Normal.
pause
goto discord_menu

:d_oldver
echo [+] Cleaning Old Versions...
cd /d "!discord_local_dir!"
for /f "delims=" %%a in ('dir /b "app-*"') do (
    for /f "delims=app- tokens=1" %%A in ("%%a") do (
        if not "%%A"=="1" ( rd /s /q "%%a" >nul 2>&1 )
    )
)
echo [+] Selesai.
pause
goto discord_menu

:d_cache
echo [+] Cleaning Cache...
taskkill /F /IM "!selected_discord!.exe" /T >nul 2>&1
rd /s /q "!discord_roaming_dir!\Cache" >nul 2>&1
rd /s /q "!discord_roaming_dir!\GPUCache" >nul 2>&1
rd /s /q "!discord_roaming_dir!\Code Cache" >nul 2>&1
echo [+] Selesai.
pause
goto discord_menu

:d_startup
echo [+] Disabling Startup...
reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "!selected_discord!" /f >nul 2>&1
echo [+] Selesai.
pause
goto discord_menu

:d_restart
echo [+] Restarting Discord...
taskkill /F /IM "!selected_discord!.exe" /T >nul 2>&1
start "" "!discord_local_dir!\Update.exe" --processStart !selected_discord!.exe
echo [+] Selesai.
pause
goto discord_menu

:: ========================================================================
:: [10] ABOUT OWNER (FIXED EMOJI)
:: ========================================================================
:about_owner
cls
color 0d
echo ========================================================================
echo                      SYSTEM OWNER INFORMATION
echo ========================================================================
echo.
echo    DEVELOPER  : KnapQi
echo    VERSION    : %version%
echo.
echo    "Too perfect to be controlled, too broken to be fixed."
echo.
echo ========================================================================
echo    [F] GIVE FEEDBACK
echo    [M] BACK TO MAIN MENU
echo ========================================================================
set /p "oc=[?] INPUT: "
if /i "%oc%"=="f" goto send_feedback
if /i "%oc%"=="m" goto main_menu
goto about_owner

:send_feedback
cls
color 0e
echo ========================================================================
echo    SILAKAN MASUKKAN KRITIK, SARAN, ATAU FEEDBACK ANDA UNTUK KnapQi
echo ========================================================================
echo.
set /p "user_msg=Pesan: "
if "%user_msg%"=="" goto about_owner
echo.
echo [+] Sedang mengirim ke Discord...
powershell -Command "$msg = \"**Feedback from %USERNAME%**`n%user_msg%\"; $payload = @{content = $msg}; Invoke-RestMethod -Uri '%webhook_url%' -Method Post -Body ($payload | ConvertTo-Json) -ContentType 'application/json'" >nul 2>&1
echo.
echo ========================================================================
echo   PESAN TERKIRIM! Terima kasih :) sudah memberi feedback.
echo ========================================================================
echo.
pause
goto about_owner

:: ========================================================================
:: DIRECT ACTIONS
:: ========================================================================
:action_iso
start "" "https://massgrave.dev/genuine-installation-media"
goto main_menu

:action_github
start "" "%github_url%"
goto main_menu

:cat_burner_direct
cls
echo [ BOOTABLE TOOLS ]
echo.
echo    [1] RUFUS
echo    [2] VENTOY
echo    [3] BACK
echo.
set /p "bc=[?] SELECT: "
if "%bc%"=="1" goto dl_rufus
if "%bc%"=="2" goto dl_ventoy
if "%bc%"=="3" goto main_menu
goto cat_burner_direct

:dl_rufus
curl -L -o "rufus.exe" "https://github.com/pbatard/rufus/releases/download/v4.4/rufus-4.4p.exe"
pause
goto cat_burner_direct

:dl_ventoy
curl -L -o "ventoy.zip" "https://github.com/ventoy/Ventoy/releases/download/v1.0.99/ventoy-1.0.99-windows.zip"
pause
goto cat_burner_direct

:cat_privacy
cls
echo [ PRIVACY TOOLS ]
echo.
echo    [1] LIBREWOLF
echo    [2] OPENVPN
echo    [3] BACK
echo.
set /p "pc=[?] SELECT: "
if "%pc%"=="1" goto dl_librewolf
if "%pc%"=="2" goto dl_openvpn
if "%pc%"=="3" goto main_menu
goto cat_privacy

:dl_librewolf
curl -L -o "librewolf.exe" "https://gitlab.com/api/v4/projects/24386000/packages/generic/librewolf/124.0.1-1/librewolf-124.0.1-1-windows-x86_64-setup.exe"
pause
goto cat_privacy

:dl_openvpn
curl -L -o "openvpn.msi" "https://swupdate.openvpn.org/community/releases/OpenVPN-2.6.9-I001-amd64.msi"
pause
goto cat_privacy

:cat_search
cls
echo [ SEARCH ENGINE ]
echo.
echo    [1] Google
echo    [2] DuckDuckGo
echo    [3] BACK
echo.
set /p "sc=[?] SELECT: "
if "%sc%"=="1" start "" "https://www.google.com" & goto cat_search
if "%sc%"=="2" start "" "https://duckduckgo.com" & goto cat_search
if "%sc%"=="3" goto main_menu
goto cat_search

:update_system
cls
echo [+] Connecting to GitHub...
curl -L -s -o "KnapQi-Updated-Version.bat" "%update_url%"
if exist "KnapQi-Updated-Version.bat" (
    start /b "" cmd /c "ping 127.0.0.1 -n 2 > nul & ren ""%~nx0"" ""Legacy-Version.old"" & start KnapQi-Updated-Version.bat"
    exit
) else (
    echo [!] Gagal Update.
    pause
    goto main_menu
)
