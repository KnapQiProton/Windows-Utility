@echo off
title KNAPQI MULTIVERSE INTERFACE - VERSION CONTROL V13.0
mode con: cols=85 lines=45

:: ========================================================================
:: CONFIGURATION
:: ========================================================================
set "version=13.0"
set "keepLanguage=en-US"
set "webhook_url=https://discord.com/api/webhooks/1455213173882753097/XihcbnWOY33qenhS-PW94Ibfkye9G-uBArL2CsiLUBmXG5gOF_zjq61nIEj7pc27yisq"
set "update_url=https://raw.githubusercontent.com/KnapQiProton/Windows-Utility/refs/heads/main/KnapQi-Utility-App.bat"
set "hellzerg_url=https://github.com/hellzerg/optimizer/releases/latest/download/Optimizer-16.7.exe"

:: Set ESC Character for Colors
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (set ESC=%%b)

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
echo    [11] CHECK FOR UPDATES (Archive Legacy Mode)
echo    [12] EXIT SYSTEM
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
if "%main_choice%"=="11" goto update_system
if "%main_choice%"=="12" exit
goto main_menu

:: ========================================================================
:: [9] APP OPTIMIZER CATEGORY
:: ========================================================================
:cat_optimizer
cls
color 09
echo ========================================================================
echo                       CATEGORY: APP OPTIMIZER
echo ========================================================================
echo.
echo    [1]  DISCORD OPTIMIZER (Full Suite)
echo    [2]  DOWNLOAD OPTIMIZER HELLZERG (Direct)
echo    [3]  BACK TO MAIN MENU
echo.
echo ========================================================================
set /p "opt_choice=[?] SELECT OPTION: "
if "%opt_choice%"=="1" goto discord_init
if "%opt_choice%"=="2" goto download_hellzerg
if "%opt_choice%"=="3" goto main_menu
goto cat_optimizer

:download_hellzerg
cls
echo ========================================================================
echo                 DOWNLOADING OPTIMIZER BY HELLZERG
echo ========================================================================
echo.
echo [+] Menghubungkan ke GitHub...
curl -L -o "Optimizer-Hellzerg.exe" "%hellzerg_url%"
if exist "Optimizer-Hellzerg.exe" (
    echo.
    echo [+] Download Selesai! File disimpan sebagai: Optimizer-Hellzerg.exe
    echo [+] Menjalankan aplikasi...
    start "" "Optimizer-Hellzerg.exe"
) else (
    echo.
    echo [!] Gagal mendownload file. Periksa koneksi internet Anda.
)
pause
goto cat_optimizer

:discord_init
cls
setlocal enabledelayedexpansion
set /a startver=0
cd /d "%appdata%"
echo [+] Mencari instalasi Discord...
for /f "delims=" %%a in ('dir /b "Discord*"') do (
    set /a startver+=1
    set "version_list[!startver!]=%%a"
    echo    [!startver!] %%a
)
if !startver!==0 (echo [!] Discord tidak ditemukan. & pause & endlocal & goto cat_optimizer)
echo.
set /p "vernum=[?] Pilih Nomor Versi: "
set "selected_discord=!version_list[%vernum%]!"
set "discord_local_dir=%localappdata%\!selected_discord!"
set "discord_roaming_dir=%appdata%\!selected_discord!"

:discord_menu
cls
echo ========================================================================
echo    DISCORD OPTIMIZER - !selected_discord!
echo ========================================================================
echo.
echo    [1]  Debloat (Hapus modul tidak penting)
echo    [2]  Clear Unused Languages
echo    [3]  Clear Logs, Crash Reports, ^& Packages
echo    [4]  Optimize CPU Priority
echo    [5]  Clear Old Application Versions
echo    [6]  Clear Cache ^& Code Cache
echo    [7]  Disable Start-Up Run
echo    [8]  Restart !selected_discord!
echo    [9]  BACK TO OPTIMIZER MENU
echo.
echo ========================================================================
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
    echo [+] Debloat Selesai. & pause & goto discord_menu
)

if "%num%"=="2" (
    for /f "delims=" %%a in ('dir /b "!discord_local_dir!\app-*"') do (
        set "lang_dir=!discord_local_dir!\%%a\locales"
        if exist "!lang_dir!" (
            cd /d "!lang_dir!"
            for /f "delims=" %%l in ('dir /b') do (
                if not "%%l"=="%keepLanguage%.pak" del /f /q "%%l" >nul 2>&1
            )
        )
    )
    echo [+] Bahasa dibersihkan. & pause & goto discord_menu
)

if "%num%"=="3" (
    del /f /q /s "!discord_local_dir!\*.log" >nul 2>&1
    del /f /q "!discord_local_dir!\packages\*.nupkg" >nul 2>&1
    del /f /s /q "!discord_roaming_dir!\*.log" >nul 2>&1
    del /f /s /q "!discord_roaming_dir!\crashpad\reports\*.dmp" >nul 2>&1
    echo [+] Logs dibersihkan. & pause & goto discord_menu
)

if "%num%"=="4" goto discord_priority

if "%num%"=="5" (
    cd /d "!discord_local_dir!"
    for /f "delims=" %%a in ('dir /b "app-*"') do (
        for /f "delims=app- tokens=1" %%A in ("%%a") do (
            for /f "delims=. tokens=1" %%B in ("%%A") do (
                if not %%B equ 1 (rd /s /q "%%a" >nul 2>&1)
            )
        )
    )
    echo [+] Versi lama dibersihkan. & pause & goto discord_menu
)

if "%num%"=="6" (
    taskkill /F /IM "!selected_discord!.exe" /T >nul 2>&1
    rd /s /q "!discord_roaming_dir!\Cache" >nul 2>&1
    rd /s /q "!discord_roaming_dir!\GPUCache" >nul 2>&1
    rd /s /q "!discord_roaming_dir!\Code Cache" >nul 2>&1
    echo [+] Cache dibersihkan. & pause & goto discord_menu
)

if "%num%"=="7" (
    reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "!selected_discord!" /f >nul 2>&1
    echo [+] Start-Up disabled. & pause & goto discord_menu
)

if "%num%"=="8" (
    taskkill /F /IM "!selected_discord!.exe" /T >nul 2>&1
    start "" "!discord_local_dir!\Update.exe" --processStart !selected_discord!.exe
    echo [+] Discord Restarted. & pause & goto discord_menu
)

if "%num%"=="9" (
    endlocal
    goto cat_optimizer
)
goto discord_menu

:discord_priority
cls
echo [ SET CPU PRIORITY ]
echo [1] High ^| [2] Low ^| [3] Normal ^| [4] BACK
set /p "prio=:"
if "%prio%"=="1" reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\!selected_discord!.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 3 /f >nul 2>&1
if "%prio%"=="2" reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\!selected_discord!.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 1 /f >nul 2>&1
if "%prio%"=="3" reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\!selected_discord!.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 2 /f >nul 2>&1
goto discord_menu

:: ========================================================================
:: MENU LAINNYA
:: ========================================================================
:cat_file
cls
echo [ CRACK FILE ]
echo    [1] 4download.net ^| [2] Yasir252.com ^| [3] BACK
set /p "fc=:"
if "%fc%"=="1" start "" "https://4download.net/" & goto cat_file
if "%fc%"=="2" start "" "https://www.yasir252.com/" & goto cat_file
goto main_menu

:cat_game
cls
echo [ CRACK GAME ]
echo    [1] SteamRIP.com ^| [2] SteamUnlocked.net ^| [3] BACK
set /p "gc=:"
if "%gc%"=="1" start "" "https://steamrip.com/" & goto cat_game
if "%gc%"=="2" start "" "https://steamunlocked.net/" & goto cat_game
goto main_menu

:cat_activation
cls
echo [ ACTIVATION ]
echo    [1] RUN MAS ^| [2] BACK
set /p "ac=:"
if "%ac%"=="1" powershell -Command "irm https://get.activated.win | iex" & pause
goto main_menu

:cat_iso
cls
start "" "https://massgrave.dev/genuine-installation-media" & goto main_menu

:cat_burner_direct
cls
echo [ BOOTABLE ]
echo    [1] RUFUS ^| [2] VENTOY ^| [3] BACK
set /p "bc=:"
if "%bc%"=="1" curl -L -o "rufus.exe" "https://github.com/pbatard/rufus/releases/download/v4.4/rufus-4.4p.exe" & pause
if "%bc%"=="2" curl -L -o "ventoy.zip" "https://github.com/ventoy/Ventoy/releases/download/v1.0.99/ventoy-1.0.99-windows.zip" & pause
goto main_menu

:cat_privacy
cls
echo [ PRIVACY ]
echo    [1] LIBREWOLF ^| [2] OPENVPN ^| [3] BACK
set /p "pc=:"
if "%pc%"=="1" curl -L -o "librewolf.exe" "https://gitlab.com/api/v4/projects/24386000/packages/generic/librewolf/124.0.1-1/librewolf-124.0.1-1-windows-x86_64-setup.exe" & pause
if "%pc%"=="2" curl -L -o "openvpn.msi" "https://swupdate.openvpn.org/community/releases/OpenVPN-2.6.9-I001-amd64.msi" & pause
goto main_menu

:cat_utility
cls
curl -L -o "cpuz.zip" "https://download.cpuid.com/cpu-z/cpu-z_2.09-en.zip" & pause & goto main_menu

:cat_search
cls
echo [ SEARCH ] ^| [1] Google ^| [2] DuckDuckGo ^| [3] BACK
set /p "sc=:"
if "%sc%"=="1" start "" "https://www.google.com" & goto cat_search
if "%sc%"=="2" start "" "https://duckduckgo.com" & goto cat_search
goto main_menu

:update_system
cls
echo [+] Connecting...
curl -L -s -o "KnapQi-Updated-Version.bat" "%update_url%"
if exist "KnapQi-Updated-Version.bat" (
    start /b "" cmd /c "ping 127.0.0.1 -n 2 > nul & ren ""%~nx0"" ""Legacy-Version.old"" & start KnapQi-Updated-Version.bat"
    exit
) else (pause & goto main_menu)

:about_owner
cls
color 0d
echo DEVELOPER : KnapQi ^| VERSION : %version%
echo "Too perfect to be controlled, too broken to be fixed."
echo [F] FEEDBACK ^| [M] BACK
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
