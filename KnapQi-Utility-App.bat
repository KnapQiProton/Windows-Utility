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
:: Download file baru
curl -L -s -o "Update_Temp.bat" "%update_url%"

if exist "Update_Temp.bat" (
    echo [+] Update file found!
    echo [+] Patching system...
    echo [+] Interface will restart in 3 seconds.
    timeout /t 3 > nul
    
    :: Perbaikan Command: Kita pakai %~f0 tanpa tanda kutip berlebih
    :: %~f0 sudah memberikan full path. Kita bungkus satu kali dengan tanda kutip untuk handle spasi.
    start /b "" cmd /c "timeout /t 1 & move /y Update_Temp.bat ""%~f0"" & start "" ""%~f0"""
    exit
) else (
    echo [-] ERROR: Gagal mendapatkan file update dari GitHub.
    pause
    goto main_menu
)
