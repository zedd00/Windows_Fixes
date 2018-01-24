# Does initial windows configuration
# To kick this off run the next 4 lines uncommented at an Administrator Powershell Prompt
# New-Item c:\downloads -type directory
# wget "https://raw.githubusercontent.com/zedd00/Windows_Fixes/master/Windows_Fix.PS1" -outfile "c:\downloads\Windows_Fix.PS1"
# set-executionpolicy unrestricted 
# c:\downloads\Windows_Fix.PS1

# Grab BlackViper's Service Settings 
## Disables unnecessary services
wget "https://raw.githubusercontent.com/madbomb122/BlackViperScript/master/BlackViper-Win10.ps1" -outfile "c:\downloads\BlackViper-Win10.ps1"
wget "https://raw.githubusercontent.com/madbomb122/BlackViperScript/master/BlackViper.csv" -outfile "c:\downloads\BlackViper.csv"
c:\downloads\BlackViper-Win10.ps1 -atos -auto -safe -min -bcsc -log -baf


# Remove unused windows Apps
## To remove all Apps
### Get-AppxPackage -allusers | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.WindowsDVDPlayer | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.WindowsPhone | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.Appconnector | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.People| Remove-AppxPackage
Get-AppxPackage -allusers E046963F.LenovoCompanion | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.XboxIdentityProvider | Remove-AppxPackage
Get-AppxPackage -allusers 9E2F88E3.Twitter | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.MicrosoftOfficeHub | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.NET.Native.Framework.1.2 | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.NET.Native.Framework.1.2 | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.Messaging| Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.XboxSpeechToTextOverlay| Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.Wallet | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.XboxGameOverlay| Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.ZuneMusic| Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.OneConnect | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.VCLibs.140.00.UWPDesktop | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.Microsoft3DViewer| Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.WindowsMaps| Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.WindowsFeedbackHub | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.XboxApp| Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.SkypeApp | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.ZuneVideo| Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.Services.Store.Engagement | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.WindowsAlarms| Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.BingSports | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.BingFinance| Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.BingNews | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.BingWeather| Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.WindowsSoundRecorder | Remove-AppxPackage
Get-AppxPackage -allusers king.com.CandyCrushSaga| Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.WindowsCamera| Remove-AppxPackage
Get-AppxPackage -allusers microsoft.windowscommunicationsapps | Remove-AppxPackage


#Download required software
##Create download directory
New-Item c:\downloads -type directory
## Download and run github
wget "https://central.github.com/deployments/desktop/desktop/latest/win32" -outfile "c:\downloads\github.exe"
c:\downloads\github.exe
## Download and run ninite installer
wget "https://ninite.com/7zip-chrome-classicstart-firefox-foxit-klitecodecs-notepadplusplus-paint.net-pidgin-putty-steam-teamviewer12-vlc-windirstat-winmerge-winscp/ninite.exe" -outfile "c:\downloads\ninite.exe"
c:\downloads\ninite.exe
## Download and install Bulk Rename Utility
wget "http://www.bulkrenameutility.co.uk/Downloads/BRU_setup.exe" -outfile "c:\downloads\BRU_setup.exe"
c:\downloads\BRU_setup.exe
## Download and install VPN Software
wget "https://downloads.nordcdn.com/apps/windows/10/NordVPN/latest/NordVPNSetup.exe" -outfile "c:\downloads\NordVPNSetup.exe"
c:\downloads\NordVPNSetup.exe
## Download and install Python 2.7
wget "https://www.python.org/ftp/python/2.7.13/python-2.7.13.msi" -outfile "c:\downloads\python-2.7.13.msi"
c:\downloads\python-2.7.13.msi
## Download and install Spybot
wget "https://download.spybot.info/AntiBeacon/Portable/SpybotAntiBeaconPortable-safer-networking.org_1.6_Dev_Test_4.paf.exe" -outfile "c:\downloads\spybot.exe"
c:\downloads\spybot.exe
## Download and install Cura
start https://ultimaker.com/en/products/cura-software/list


#Show hidden files and extensions
$key = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'
Set-ItemProperty $key Hidden 1
Set-ItemProperty $key HideFileExt 0
Set-ItemProperty $key ShowSuperHidden 1
Set-ItemProperty $key DontPrettyPath 1
New-ItemProperty $key Start_NotifyNewApps -value 0

# Disable Java Sponsors and Updates
Set-ItemProperty HKLM:\SOFTWARE\JavaSoft SPONSORS 'DISABLE'
Set-ItemProperty HKLM:\SOFTWARE\Wow6432Node\JavaSoft SPONSORS 'DISABLE'
Set-ItemProperty HKLM:\SOFTWARE\JavaSoft\Java Update\Policy EnableJavaUpdate 00000000
$key = 'HKCU:\SOFTWARE\Wow6432Node\JavaSoft\Java Update\Policy'
Set-ItemProperty $key EnableJavaUpdate 00000000
Set-ItemProperty $key NotifyDownload 00000000
Set-ItemProperty $key PostStatusUrl ''
Set-ItemProperty $key UpdateMin ''
Set-ItemProperty $key Frequency ''

# Enable HKCR in powershell
New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT

# Supress boot popups
Set-ItemProperty HKLM:\SYSTEM\CurrentControlSet\Control\Windows NoPopupsOnBoot 1

# Remove user folders from "My Computer"
Remove-Item HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\* -Recurse

# Remove user folders from "Explorer"
Remove-Item HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\* -Recurse

# Keep Taskbar icons from Grouping. 1 always combines
Set-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced TaskbarGlomming 0

# Disable Search the Internet for program to open filetype
Set-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer InternetOpenWith 1

# Disable check for solution to unexpected closing of application
New-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows\Windows Error Reporting\' Disabled -value 1
Set-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows\Windows Error Reporting\' Disabled 1
New-ItemProperty 'HKCU:\SOFTWARE\Microsoft\Windows\Windows Error Reporting\' Disabled -value 1
Set-ItemProperty 'HKCU:\SOFTWARE\Microsoft\Windows\Windows Error Reporting\' Disabled 1
Set-ItemProperty 'HKCU:\SOFTWARE\Microsoft\Windows\Windows Error Reporting\' AutoApproveOSDumps 0
Set-ItemProperty 'HKCU:\SOFTWARE\Microsoft\Windows\Windows Error Reporting\' DisableArchive 0
Set-ItemProperty 'HKCU:\SOFTWARE\Microsoft\Windows\Windows Error Reporting\' DontSendAdditionalData 1
Set-ItemProperty 'HKCU:\SOFTWARE\Microsoft\Windows\Windows Error Reporting\' DontShowUI 1
Set-ItemProperty 'HKCU:\SOFTWARE\Microsoft\Windows\Windows Error Reporting\' LoggingDisabled 1
Set-Service WerSvc -StartupType disabled

# Remove OneDrive from explorer
Set-ItemProperty HKCR:\CLSID\'{018D5C66-4533-4307-9B53-224DE2ED1FE6}' System.IsPinnedToNameSpaceTree 00000000 
Set-ItemProperty HKCR:\Wow6432Node\CLSID\'{018D5C66-4533-4307-9B53-224DE2ED1FE6}' System.IsPinnedToNameSpaceTree 0000000

# Turn Cortana off and block access
Set-ItemProperty HKCU:\Software\Microsoft\Windows\CurrentVersion\Search\ SearchboxTaskbarMode 0
Set-ItemProperty 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search' AllowCortana 0 
Get-NetFirewallRule | where {$_.DisplayGroup -like '*Microsoft*Windows*Cortana*'} | Enable-NetFirewallRule
Get-NetFirewallRule -DisplayGroup 'Cortana' | Enable-NetFirewallRule

#Setup taskbar, 
Remove-Item $env:APPDATA'\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\*'
Remove-Item HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband\* -Recurse

Stop-Process -processname explorer

