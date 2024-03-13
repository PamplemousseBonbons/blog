@echo off
REM Install Internet Information Server (IIS) if not already installed
c:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -Command Import-Module -Name ServerManager
c:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -Command Install-WindowsFeature Web-Server

REM Define the source directory of your web application (change this to your actual source directory)
set SOURCE_DIR="F:\vscode\vue\1"

REM Define the destination directory on the server (usually the default IIS web directory)
set DEST_DIR="F:\vscode\vue\IIS"

REM Create the destination directory if it doesn't exist
if not exist %DEST_DIR% mkdir %DEST_DIR%

REM Copy the web application to the destination directory
xcopy /E /Y %SOURCE_DIR% %DEST_DIR%

REM Install the IIS Management Scripts and Tools
c:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -Command Install-WindowsFeature Web-Scripting-Tools

REM Create a new website in IIS pointing to your web application
c:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -Command New-Website -Name "YourWebApp" -Port 80 -PhysicalPath %DEST_DIR%

echo Deployment complete. Your web application is now deployed and accessible at http://localhost.

pause