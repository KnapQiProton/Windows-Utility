@echo off
title KNAPQI MULTIVERSE INTERFACE - FINAL REVISION V17.4
mode con: cols=90 lines=48
setlocal EnableDelayedExpansion

:: ========================================================================
:: ANSI COLOR SETUP
:: ========================================================================
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set "ESC=%%b"
)
set "Cyan=%ESC%[36m"
set "Green=%ESC%[92m"
set "Yellow=%ESC%[93m"
set "White=%ESC%[97m"
set "Red=%ESC%[91m"
set "Blue=%ESC%[94m"
set "Magenta=%ESC%[95m"
set "Grey=%ESC%[90m"
set "Reset=%ESC%[0m"

:: ========================================================================
:: CONFIGURATION
:: ========================================================================
set "version=17.4"
:: Webhook terenkripsi (split menjadi 4 bagian)
set "wh_part1=aHR0cHM6Ly9kaXNjb3JkLmNvbS9hcGkvd2ViaG9va3MvMTQ1NTIxMzE3Mzg4Mjc1MzA5"
set "wh_part2=Ny9YaWhjYm5XT1kzM3FlbmhTLVBXOTRJYmZreWU5Ry11QkFyTDJDc2lMVUJtWEc1Z09G"
set "wh_part3=X3pqcTYxbklFajdwYzI3eWlzcQ=="
set "update_url=https://raw.githubusercontent.com/KnapQiProton/Windows-Utility/refs/heads/main/KnapQi-Utility-App.bat"
set "github_url=https://github.com/KnapQiProton/Windows-Utility"
set "hellzerg_url=https://github.com/hellzerg/optimizer/releases/latest/download/Optimizer-16.7.exe"

:main_menu
cls
color 0b
echo ==========================================================================================
echo             IDENTIFIED: KnapQi ^| VERSION: %version%
echo ==========================================================================================
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
echo    [10] SYSTEM, NETWORK ^& LEARIX TOOLS (Advanced)
echo    [11] BROWSER INSTALLER (Chrome, Firefox, Brave)
echo.
echo ---------------------------- SYSTEM OWNER ------------------------------
echo.
echo    [12] ABOUT OWNER ^& FEEDBACK
echo    [13] VIEW SOURCE / GITHUB
echo    [14] CHECK FOR UPDATES
echo    [15] EXIT SYSTEM
echo.
echo ==========================================================================================
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
if "%main_choice%"=="10" goto cat_sysnet
if "%main_choice%"=="11" goto cat_browser
if "%main_choice%"=="12" goto about_owner
if "%main_choice%"=="13" start "" "%github_url%" & goto main_menu
if "%main_choice%"=="14" goto update_system
if "%main_choice%"=="15" exit
goto main_menu

:: ========================================================================
:: DECODE WEBHOOK FUNCTION
:: ========================================================================
:decode_webhook
set "encoded=%wh_part1%%wh_part2%%wh_part3%"
powershell -Command "$decoded = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('%encoded%')); Write-Output $decoded" > "%temp%\wh_temp.txt" 2>nul
if exist "%temp%\wh_temp.txt" (
    set /p webhook_url=<"%temp%\wh_temp.txt"
    del "%temp%\wh_temp.txt" >nul 2>&1
)
goto :eof

:: ========================================================================
:: DOWNLOAD ENGINE - TAMPILAN KEREN (dipanggil semua download)
:: ========================================================================
:dl_engine
call :fancy_download
goto %BACK_GOTO%

:fancy_download
cls
echo.
echo  %Blue%==========================================================================================%Reset%
echo  %Cyan%                      %TITLE_DL% - DOWNLOAD MANAGER v%version%                      %Reset%
echo  %Blue%==========================================================================================%Reset%
echo.
echo  %Grey%   Tanggal: %DATE%               Waktu: %TIME%   %Reset%
echo.
echo  %White%   Target      : %Cyan%%TITLE_DL%%Reset%
echo  %White%   File output : %Yellow%%FILENAME%%Reset%
echo  %White%   URL         : %Grey%%URL%%Reset%
echo.
echo  %Yellow%   Sedang mengunduh...%Reset%
echo.
echo  %Grey%Progress:%Reset%
<nul set /p="  "
curl -L -# -o "%FILENAME%" "%URL%"
echo %Reset%
echo.
if exist "%FILENAME%" (
    echo  %Green%==========================================================================================%Reset%
    echo  %Green%                                DOWNLOAD BERHASIL!                                   %Reset%
    echo  %Green%==========================================================================================%Reset%
    echo  %White%   Lokasi file : %CD%\%FILENAME%
    echo  %White%   Waktu selesai : %TIME%
) else (
    echo  %Red%==========================================================================================%Reset%
    echo  %Red%                                  DOWNLOAD GAGAL!                                      %Reset%
    echo  %Red%==========================================================================================%Reset%
    echo  %Yellow%   Kemungkinan penyebab: koneksi buruk / URL salah / server down%Reset%
)
echo.
pause
goto :eof

:: ========================================================================
:: [5] BOOTABLE TOOLS
:: ========================================================================
:cat_burner_direct
cls
color 0b
echo ==========================================================================================
echo [ CATEGORY: BOOTABLE TOOLS ]
echo ==========================================================================================
echo.
echo    [1]  RUFUS
echo    [2]  VENTOY
echo    [3]  BACK TO MAIN MENU
echo.
set /p "bc=:"
if "%bc%"=="1" set "TITLE_DL=RUFUS" & set "FILENAME=rufus.exe" & set "URL=https://github.com/pbatard/rufus/releases/download/v4.4/rufus-4.4p.exe" & set "BACK_GOTO=cat_burner_direct" & goto dl_engine
if "%bc%"=="2" set "TITLE_DL=VENTOY" & set "FILENAME=ventoy.zip" & set "URL=https://github.com/ventoy/Ventoy/releases/download/v1.0.99/ventoy-1.0.99-windows.zip" & set "BACK_GOTO=cat_burner_direct" & goto dl_engine
if "%bc%"=="3" goto main_menu
goto cat_burner_direct

:: ========================================================================
:: [6] PRIVACY TOOLS
:: ========================================================================
:cat_privacy
cls
color 0d
echo ==========================================================================================
echo [ CATEGORY: PRIVACY TOOLS ]
echo ==========================================================================================
echo.
echo    [1]  LIBREWOLF
echo    [2]  OPENVPN
echo    [3]  BACK TO MAIN MENU
echo.
set /p "pc=:"
if "%pc%"=="1" set "TITLE_DL=LibreWolf" & set "FILENAME=librewolf.exe" & set "URL=https://gitlab.com/api/v4/projects/24386000/packages/generic/librewolf/124.0.1-1/librewolf-124.0.1-1-windows-x86_64-setup.exe" & set "BACK_GOTO=cat_privacy" & goto dl_engine
if "%pc%"=="2" set "TITLE_DL=OpenVPN" & set "FILENAME=openvpn.msi" & set "URL=https://swupdate.openvpn.org/community/releases/OpenVPN-2.6.9-I001-amd64.msi" & set "BACK_GOTO=cat_privacy" & goto dl_engine
if "%pc%"=="3" goto main_menu
goto cat_privacy

:: ========================================================================
:: [7] WINDOWS UTILITY
:: ========================================================================
:cat_utility
cls
color 0b
echo ==========================================================================================
echo [ CATEGORY: WINDOWS UTILITY ]
echo ==========================================================================================
echo.
echo    [1]  CPU-Z
echo    [2]  HWMonitor
echo    [3]  BACK TO MAIN MENU
echo.
set /p "uc=:"
if "%uc%"=="1" set "TITLE_DL=CPU-Z" & set "FILENAME=cpuz.zip" & set "URL=https://download.cpuid.com/cpu-z/cpu-z_2.09-en.zip" & set "BACK_GOTO=cat_utility" & goto dl_engine
if "%uc%"=="2" set "TITLE_DL=HWMonitor" & set "FILENAME=hwmonitor.zip" & set "URL=https://download.cpuid.com/hwmonitor/hwmonitor_1.53.zip" & set "BACK_GOTO=cat_utility" & goto dl_engine
if "%uc%"=="3" goto main_menu
goto cat_utility

:: ========================================================================
:: [8] SEARCH ENGINE
:: ========================================================================
:cat_search
cls
color 0e
echo ==========================================================================================
echo [ CATEGORY: SEARCH ENGINE ]
echo ==========================================================================================
echo.
echo    [1]  Google
echo    [2]  DuckDuckGo
echo    [3]  BACK TO MAIN MENU
echo.
set /p "sc=:"
if "%sc%"=="1" start "" "https://www.google.com" & goto cat_search
if "%sc%"=="2" start "" "https://duckduckgo.com" & goto cat_search
if "%sc%"=="3" goto main_menu
goto cat_search

:: ========================================================================
:: [9] APP OPTIMIZER
:: ========================================================================
:cat_optimizer
cls
color 09
echo ==========================================================================================
echo [ CATEGORY: APP OPTIMIZER ]
echo ==========================================================================================
echo.
echo    [1]  DISCORD OPTIMIZER
echo    [2]  HELLZERG OPTIMIZER
echo    [3]  BACK TO MAIN MENU
echo.
set /p "opt=:"
if "%opt%"=="1" goto discord_init
if "%opt%"=="2" set "TITLE_DL=Optimizer Hellzerg" & set "FILENAME=Optimizer.exe" & set "URL=%hellzerg_url%" & set "BACK_GOTO=cat_optimizer" & goto dl_engine
if "%opt%"=="3" goto main_menu
goto cat_optimizer

:: ========================================================================
:: DISCORD OPTIMIZER
:: ========================================================================
:discord_init
set /a startver=0
cd /d "%appdata%"
for /f "delims=" %%a in ('dir /b /ad "Discord*" 2^>nul') do (
    set /a startver+=1
    set "version_list[!startver!]=%%a"
    echo    [!startver!] %%a
)
if !startver!==0 (
    echo %Red%[!] Discord tidak terdeteksi.%Reset%
    pause & goto cat_optimizer
)
set /p "vernum=Pilih Nomor Version: "
set "selected_discord=!version_list[%vernum%]!"
if not defined selected_discord goto discord_init
goto discord_menu

:discord_menu
cls
echo %Cyan%[ DISCORD OPTIMIZER - !selected_discord! ]%Reset%
echo.
echo    [1]  Full Debloat ^& Clear Cache
echo    [2]  Back
echo.
set /p "num=:"
if "%num%"=="1" (
    taskkill /F /IM "Discord.exe" /T >nul 2>&1
    taskkill /F /IM "Update.exe" /T >nul 2>&1
    rd /s /q "%appdata%\!selected_discord!\Cache" >nul 2>&1
    rd /s /q "%appdata%\!selected_discord!\Code Cache" >nul 2>&1
    rd /s /q "%appdata%\!selected_discord!\GPUCache" >nul 2>&1
    echo %Green%[+] Discord Cache & Process berhasil dibersihkan.%Reset%
    echo %Yellow%[!] Jalankan Discord kembali secara manual.%Reset%
    pause
    goto cat_optimizer
)
goto cat_optimizer

:: ========================================================================
:: [10] SYSTEM, NETWORK ^& LEARIX TOOLS
:: ========================================================================
:cat_sysnet
cls
color 0b
echo ==========================================================================================
echo [ CATEGORY: SYSTEM, NETWORK ^& LEARIX TOOLS ]
echo ==========================================================================================
echo.
echo    [1]  ADVANCED CLEANER (Learix Engine)
echo    [2]  FPS BOOSTER (Registry Tweaks)
echo    [3]  WINDOWS DEBLOATER (Remove Bloatware)
echo    [4]  KNAPQI NETWORK MANAGER (Refresh Connection)
echo    [5]  BACK TO MAIN MENU
echo.
set /p "sn=[?] SELECT: "
if "%sn%"=="1" goto tool_cleaner
if "%sn%"=="2" goto tool_fps
if "%sn%"=="3" goto tool_debloat
if "%sn%"=="4" goto tool_net_manager
if "%sn%"=="5" goto main_menu
goto cat_sysnet

:tool_cleaner
cls
echo %Cyan%[+] Menjalankan Advanced System Cleaner...%Reset%
del /s /f /q c:\windows\temp\*.* >nul 2>&1
rd /s /q c:\windows\temp >nul 2>&1
md c:\windows\temp >nul 2>&1
del /s /f /q %temp%\*.* >nul 2>&1
del /s /f /q C:\Windows\Prefetch\*.* >nul 2>&1
del /s /f /q c:\windows\spool\printers\*.* >nul 2>&1
echo %Green%[+] Junk Files Successfully Wiped.%Reset%
pause
goto cat_sysnet

:tool_fps
cls
echo %Cyan%[+] Applying Learix FPS Boost Tweaks...%Reset%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMin" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "38" /f >nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d "8" /f >nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d "6" /f >nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f >nul 2>&1
echo %Green%[+] FPS Boost Tweaks Applied Successfully.%Reset%
pause
goto cat_sysnet

:tool_debloat
cls
echo %Cyan%[+] Running Windows Debloater (Safe Mode)...%Reset%
powershell -Command "Get-AppxPackage *3dbuilder* | Remove-AppxPackage" >nul 2>&1
powershell -Command "Get-AppxPackage *bingfinance* | Remove-AppxPackage" >nul 2>&1
powershell -Command "Get-AppxPackage *bingnews* | Remove-AppxPackage" >nul 2>&1
powershell -Command "Get-AppxPackage *bingsports* | Remove-AppxPackage" >nul 2>&1
powershell -Command "Get-AppxPackage *candycrush* | Remove-AppxPackage" >nul 2>&1
powershell -Command "Get-AppxPackage *facebook* | Remove-AppxPackage" >nul 2>&1
powershell -Command "Get-AppxPackage *minecraft* | Remove-AppxPackage" >nul 2>&1
powershell -Command "Get-AppxPackage *netflix* | Remove-AppxPackage" >nul 2>&1
powershell -Command "Get-AppxPackage *onenote* | Remove-AppxPackage" >nul 2>&1
powershell -Command "Get-AppxPackage *spotify* | Remove-AppxPackage" >nul 2>&1
powershell -Command "Get-AppxPackage *twitter* | Remove-AppxPackage" >nul 2>&1
powershell -Command "Get-AppxPackage *xbox* | Remove-AppxPackage" >nul 2>&1
echo %Green%[+] Common Bloatware Removed Safely.%Reset%
echo %Yellow%[!] Apps bisa diinstall kembali dari Microsoft Store jika perlu.%Reset%
pause
goto cat_sysnet

:tool_net_manager
cls
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo %Red%[!] Harus dijalankan sebagai Administrator!%Reset%
    pause & goto cat_sysnet
)
echo %Cyan%[+] Mendeteksi interface jaringan aktif...%Reset%
set "interface="
for /f "tokens=2 delims=:" %%a in ('netsh interface show interface ^| findstr /i "Connected"') do (
    set "interface=%%a"
    set "interface=!interface:~1!"
    goto found_interface
)
:found_interface
if "!interface!"=="" (
    echo %Red%[!] Tidak ada interface jaringan aktif.%Reset%
    pause & goto cat_sysnet
)
echo %Green%[+] Interface ditemukan: !interface!%Reset%
echo %Cyan%[+] Refreshing Network Connection...%Reset%
netsh interface set interface "!interface!" disable >nul 2>&1
timeout /t 3 /nobreak >nul
netsh interface set interface "!interface!" enable >nul 2>&1
ipconfig /flushdns >nul 2>&1
netsh winsock reset >nul 2>&1
echo %Green%[+] Network berhasil direfresh!%Reset%
pause
goto cat_sysnet

:: ========================================================================
:: [11] BROWSER INSTALLER
:: ========================================================================
:cat_browser
cls
color 0b
echo ==========================================================================================
echo [ CATEGORY: BROWSER INSTALLER ]
echo ==========================================================================================
echo.
echo    [1]  Google Chrome
echo    [2]  Mozilla Firefox
echo    [3]  Brave Browser
echo    [4]  BACK TO MAIN MENU
echo.
set /p "br=[?] SELECT: "
if "%br%"=="1" set "TITLE_DL=Google Chrome" & set "FILENAME=ChromeSetup.exe" & set "URL=https://dl.google.com/chrome/install/standalonesetup64.exe" & set "BACK_GOTO=cat_browser" & goto dl_engine
if "%br%"=="2" set "TITLE_DL=Mozilla Firefox" & set "FILENAME=FirefoxSetup.exe" & set "URL=https://download.mozilla.org/?product=firefox-latest&os=win64&lang=en-US" & set "BACK_GOTO=cat_browser" & goto dl_engine
if "%br%"=="3" set "TITLE_DL=Brave Browser" & set "FILENAME=BraveSetup.exe" & set "URL=https://laptop-updates.brave.com/latest/winx64" & set "BACK_GOTO=cat_browser" & goto dl_engine
if "%br%"=="4" goto main_menu
goto cat_browser

:: ========================================================================
:: CRACK CATEGORIES
:: ========================================================================
:cat_file
cls & color 03
echo ==========================================================================================
echo [ CATEGORY: CRACK FILE ]
echo ==========================================================================================
echo.
echo    [1]  4download.net
echo    [2]  Yasir252.com
echo    [3]  BACK TO MAIN MENU
echo.
set /p "fc=:"
if "%fc%"=="1" start "" "https://4download.net/" & goto cat_file
if "%fc%"=="2" start "" "https://www.yasir252.com/" & goto cat_file
if "%fc%"=="3" goto main_menu
goto cat_file

:cat_game
cls & color 0c
echo ==========================================================================================
echo [ CATEGORY: CRACK GAME ]
echo ==========================================================================================
echo.
echo    [1]  SteamRIP.com
echo    [2]  SteamUnlocked.net
echo    [3]  BACK TO MAIN MENU
echo.
set /p "gc=:"
if "%gc%"=="1" start "" "https://steamrip.com/" & goto cat_game
if "%gc%"=="2" start "" "https://steamunlocked.net/" & goto cat_game
if "%gc%"=="3" goto main_menu
goto cat_game

:: ========================================================================
:: SYSTEM ACTIVATION
:: ========================================================================
:cat_activation
cls
color 0a
echo ==========================================================================================
echo [ CATEGORY: SYSTEM ACTIVATION ]
echo ==========================================================================================
echo.
echo    [1]  RUN MAS (Online Activation)
echo    [2]  BACK TO MAIN MENU
echo.
set /p "ac=:"
if "%ac%"=="1" powershell -Command "irm https://get.activated.win | iex" & pause & goto main_menu
if "%ac%"=="2" goto main_menu
goto cat_activation

:: ========================================================================
:: ABOUT & FEEDBACK
:: ========================================================================
:about_owner
cls
color 0d
echo ==========================================================================================
echo                      SYSTEM OWNER INFORMATION
echo ==========================================================================================
echo.
echo    DEVELOPER  : KnapQi
echo    VERSION    : %version%
echo.
echo    "Too perfect to be controlled, too broken to be fixed."
echo.
echo ==========================================================================================
echo.
echo    [F] GIVE FEEDBACK
echo    [M] BACK TO MAIN MENU
echo.
echo ==========================================================================================
set /p "oc=[?] SELECT: "
if /i "%oc%"=="f" goto send_feedback
if /i "%oc%"=="m" goto main_menu
goto about_owner

:: ========================================================================
:: SEND FEEDBACK SYSTEM (SECURE VERSION)
:: ========================================================================
:send_feedback
cls
color 0e
echo ==========================================================================================
echo           KIRIM FEEDBACK KE DEVELOPER (KNAPQI)
echo ==========================================================================================
echo.
echo  %Yellow%Tulis pesan feedback kamu di bawah ini:%Reset%
echo  %Grey%(Kosongkan untuk batal)%Reset%
echo.
set /p "user_msg=Pesan: "

if "%user_msg%"=="" (
    echo.
    echo  %Red%[!] Feedback dibatalkan.%Reset%
    timeout /t 2 /nobreak >nul
    goto about_owner
)

echo.
echo  %Cyan%[+] Sedang mengirim feedback...%Reset%
echo.

:: Decode webhook dari enkripsi
call :decode_webhook

:: Get computer info untuk context
set "pc_name=%COMPUTERNAME%"
set "user_name=%USERNAME%"
set "timestamp=%DATE% %TIME%"

:: Escape special characters in message
set "user_msg=%user_msg:"=\"%"

:: Send to Discord dengan error handling
powershell -Command "try { $payload = @{ content = \"**[FEEDBACK BARU]**`n**User:** %user_name%`n**PC:** %pc_name%`n**Time:** %timestamp%`n**Pesan:**`n%user_msg%\" } | ConvertTo-Json; Invoke-RestMethod -Uri '%webhook_url%' -Method Post -Body $payload -ContentType 'application/json' -ErrorAction Stop; exit 0 } catch { exit 1 }" >nul 2>&1

if %errorlevel%==0 (
    echo  %Green%==========================================================================================%Reset%
    echo  %Green%                           FEEDBACK BERHASIL TERKIRIM!                              %Reset%
    echo  %Green%==========================================================================================%Reset%
    echo.
    echo  %White%   Terima kasih sudah memberi feedback untuk KnapQi Utility!%Reset%
    echo  %White%   Developer akan segera membaca pesan kamu.%Reset%
    echo.
) else (
    echo  %Red%==========================================================================================%Reset%
    echo  %Red%                              GAGAL MENGIRIM FEEDBACK                                %Reset%
    echo  %Red%==========================================================================================%Reset%
    echo.
    echo  %Yellow%   Kemungkinan penyebab:%Reset%
    echo  %Yellow%   - Koneksi internet bermasalah%Reset%
    echo  %Yellow%   - Firewall memblokir koneksi%Reset%
    echo  %Yellow%   - Discord webhook tidak aktif%Reset%
    echo.
    echo  %Cyan%   Alternatif: Kirim feedback manual via GitHub Issues%Reset%
    echo.
)

pause
goto main_menu

:: ========================================================================
:: UPDATE SYSTEM
:: ========================================================================
:update_system
cls
echo [+] Memeriksa pembaruan...
curl -L -s -o "New.bat" "%update_url%"
if exist "New.bat" (
    echo [+] Update ditemukan. Menginstal...
    pause
    start /b "" cmd /c "timeout /t 2 >nul & ren "%~nx0" "Backup.bat" & ren "New.bat" "%~nx0" & start "" "%~nx0""
    exit
)
echo [+] Tidak ada pembaruan tersedia.
pause
goto main_menu
