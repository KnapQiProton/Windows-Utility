@echo off
title KNAPQI MULTIVERSE INTERFACE - STABLE FINAL V15.3
mode con: cols=85 lines=45
setlocal EnableDelayedExpansion

:: ========================================================================
:: CONFIGURATION
:: ========================================================================
set "version=15.3"
set "webhook_url=https://discord.com/api/webhooks/1455213173882753097/XihcbnWOY33qenhS-PW94Ibfkye9G-uBArL2CsiLUBmXG5gOF_zjq61nIEj7pc27yisq"
set "github_url=https://github.com/KnapQiProton/Windows-Utility"
set "hellzerg_url=https://github.com/hellzerg/optimizer/releases/latest/download/Optimizer-16.7.exe"
set "keepLanguage=en-US"

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
if "%main_choice%"=="4" start "" "https://massgrave.dev/genuine-installation-media" & goto main_menu
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

:: --- [1] CRACK FILE ---
:cat_file
cls
color 03
echo ========================================================================
echo [ CATEGORY: CRACK FILE ]
echo ========================================================================
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

:: --- [2] CRACK GAME ---
:cat_game
cls
color 0c
echo ========================================================================
echo [ CATEGORY: CRACK GAME ]
echo ========================================================================
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

:: --- [3] SYSTEM ACTIVATION ---
:cat_activation
cls
color 0a
echo ========================================================================
echo [ CATEGORY: SYSTEM ACTIVATION ]
echo ========================================================================
echo.
echo    [1] RUN MAS (Online Activation)
echo    [2] BACK TO MAIN MENU
echo.
set /p "ac=[?] SELECT: "
if "%ac%"=="1" goto run_mas
if "%ac%"=="2" goto main_menu
goto cat_activation

:run_mas
powershell -Command "irm https://get.activated.win | iex"
pause
goto cat_activation

:: --- [5] BOOTABLE TOOLS ---
:cat_burner_direct
cls
color 0b
echo ========================================================================
echo [ CATEGORY: BOOTABLE TOOLS ]
echo ========================================================================
echo.
echo    [1] RUFUS
echo    [2] VENTOY
echo    [3] BACK TO MAIN MENU
echo.
set /p "bc=[?] SELECT: "
if "%bc%"=="1" goto dl_rufus
if "%bc%"=="2" goto dl_ventoy
if "%bc%"=="3" goto main_menu
goto cat_burner_direct

:dl_rufus
cls
echo Starting Download: RUFUS ^| Time: %TIME%
curl -L -# -o "rufus.exe" "https://github.com/pbatard/rufus/releases/download/v4.4/rufus-4.4p.exe"
echo Download Completed.
pause
goto cat_burner_direct

:dl_ventoy
cls
echo Starting Download: VENTOY ^| Time: %TIME%
curl -L -# -o "ventoy.zip" "https://github.com/ventoy/Ventoy/releases/download/v1.0.99/ventoy-1.0.99-windows.zip"
echo Download Completed.
pause
goto cat_burner_direct

:: --- [6] PRIVACY TOOLS ---
:cat_privacy
cls
color 0d
echo ========================================================================
echo [ CATEGORY: PRIVACY TOOLS ]
echo ========================================================================
echo.
echo    [1] LIBREWOLF
echo    [2] OPENVPN
echo    [3] BACK TO MAIN MENU
echo.
set /p "pc=[?] SELECT: "
if "%pc%"=="1" goto dl_librewolf
if "%pc%"=="2" goto dl_openvpn
if "%pc%"=="3" goto main_menu
goto cat_privacy

:dl_librewolf
cls
echo Starting Download: LIBREWOLF ^| Time: %TIME%
curl -L -# -o "librewolf.exe" "https://gitlab.com/api/v4/projects/24386000/packages/generic/librewolf/124.0.1-1/librewolf-124.0.1-1-windows-x86_64-setup.exe"
echo Download Completed.
pause
goto cat_privacy

:dl_openvpn
cls
echo Starting Download: OPENVPN ^| Time: %TIME%
curl -L -# -o "openvpn.msi" "https://swupdate.openvpn.org/community/releases/OpenVPN-2.6.9-I001-amd64.msi"
echo Download Completed.
pause
goto cat_privacy

:: --- [7] WINDOWS UTILITY ---
:cat_utility
cls
color 0b
echo ========================================================================
echo [ CATEGORY: WINDOWS UTILITY ]
echo ========================================================================
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
cls
echo Starting Download: CPU-Z ^| Time: %TIME%
curl -L -# -o "cpuz.zip" "https://download.cpuid.com/cpu-z/cpu-z_2.09-en.zip"
echo Download Completed at %TIME%
pause
goto cat_utility

:dl_hwmonitor
cls
echo Starting Download: HWMonitor ^| Time: %TIME%
curl -L -# -o "hwmonitor.zip" "https://download.cpuid.com/hwmonitor/hwmonitor_1.53.zip"
echo Download Completed at %TIME%
pause
goto cat_utility

:: --- [8] SEARCH ENGINE ---
:cat_search
cls
color 0e
echo ========================================================================
echo [ CATEGORY: SEARCH ENGINE ]
echo ========================================================================
echo.
echo    [1] Google
echo    [2] DuckDuckGo
echo    [3] BACK TO MAIN MENU
echo.
set /p "sc=[?] SELECT: "
if "%sc%"=="1" start "" "https://www.google.com" & goto cat_search
if "%sc%"=="2" start "" "https://duckduckgo.com" & goto cat_search
if "%sc%"=="3" goto main_menu
goto cat_search

:: --- [9] APP OPTIMIZER ---
:cat_optimizer
cls
color 09
echo ========================================================================
echo [ CATEGORY: APP OPTIMIZER ]
echo ========================================================================
echo.
echo    [1] DISCORD OPTIMIZER
echo    [2] DOWNLOAD OPTIMIZER HELLZERG
echo    [3] BACK TO MAIN MENU
echo.
set /p "opt_choice=[?] SELECT: "
if "%opt_choice%"=="1" goto discord_init
if "%opt_choice%"=="2" goto download_hellzerg
if "%opt_choice%"=="3" goto main_menu
goto cat_optimizer

:discord_init
cls
set /a startver=0
cd /d "%appdata%"
for /f "delims=" %%a in ('dir /b "Discord*"') do (
    set /a startver+=1
    set "version_list[!startver!]=%%a"
    echo    [!startver!] %%a
)
if !startver!==0 (
    echo [!] No Discord installations found.
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
echo ========================================================================
echo [ DISCORD OPTIMIZER - !selected_discord! ]
echo ========================================================================
echo.
echo    [1] Debloat Modules
echo    [2] Clear Languages
echo    [3] Clear Logs
echo    [4] High Priority
echo    [5] BACK TO OPTIMIZER MENU
echo.
set /p "num=[?] PILIHAN: "
if "%num%"=="1" goto d_debloat
if "%num%"=="2" goto d_langs
if "%num%"=="3" goto d_logs
if "%num%"=="4" goto d_prio
if "%num%"=="5" goto cat_optimizer
goto discord_menu

:d_debloat
echo Cleaning Modules...
taskkill /F /IM "!selected_discord!.exe" /T >nul 2>&1
for /f "delims=" %%a in ('dir /b "!discord_local_dir!\app-*"') do (
    if exist "!discord_local_dir!\%%a\modules" (
        cd /d "!discord_local_dir!\%%a\modules"
        for /f "delims=" %%m in ('dir /b') do (
            echo(%%m|findstr "discord_desktop_core-* discord_modules-* discord_utils-* discord_voice-*" >nul || (rd /s /q "%%m" >nul 2>&1)
        )
    )
)
echo Done.
pause
goto discord_menu

:d_langs
echo Cleaning Languages...
for /f "delims=" %%a in ('dir /b "!discord_local_dir!\app-*"') do (
    if exist "!discord_local_dir!\%%a\locales" (
        cd /d "!discord_local_dir!\%%a\locales"
        for /f "delims=" %%l in ('dir /b') do if not "%%l"=="%keepLanguage%.pak" del /f /q "%%l" >nul 2>&1
    )
)
echo Done.
pause
goto discord_menu

:d_logs
echo Cleaning Logs...
del /f /q /s "!discord_local_dir!\*.log" >nul 2>&1
echo Done.
pause
goto discord_menu

:d_prio
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\!selected_discord!.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 3 /f >nul 2>&1
echo Priority set to High.
pause
goto discord_menu

:download_hellzerg
cls
echo Downloading Hellzerg Optimizer...
curl -L -# -o "Optimizer-Hellzerg.exe" "%hellzerg_url%"
echo Done.
start "" "Optimizer-Hellzerg.exe"
pause
goto cat_optimizer

:: --- [10] ABOUT OWNER & FEEDBACK (CLEAN - NO EMOJI) ---
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
echo   PESAN TERKIRIM! Terima kasih sudah memberi feedback.
echo ========================================================================
echo.
pause
goto main_menu

:: --- [12] UPDATE SYSTEM (TEXT ONLY) ---
:update_system
cls
echo ========================================================================
echo                        SYSTEM UPDATE CHECK
echo ========================================================================
echo.
echo    [!] FITUR AUTO-UPDATE SAAT INI DINONAKTIFKAN OLEH DEVELOPER.
echo    [!] SILAKAN CEK GITHUB UNTUK INFO TERBARU.
echo.
echo ========================================================================
pause
goto main_menu
