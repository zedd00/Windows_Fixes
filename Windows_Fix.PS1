# Does initial windows configuration
# To kick this off run the next 4 lines uncommented at an Administrator Powershell Prompt
# New-Item c:\downloads -type directory
# wget "https://raw.githubusercontent.com/zedd00/Windows_Fixes/master/Windows_Fix.PS1" -outfile "c:\downloads\Windows_Fix.PS1"
# set-executionpolicy unrestricted 
# c:\downloads\Windows_Fix.PS1

# SetItem Function
function SetItem  {
    Param
    (
         [Parameter(Mandatory=$true, Position=0)]
         [string] $name,
         [Parameter(Mandatory=$true, Position=1)]
         [string] $value,
         [Parameter(Mandatory=$false, Position=2)]
         [string] $type ='dword'
    )

	If(!(Test-Path $key))
	  {
		New-Item -Path $key -Force
		New-ItemProperty -Path $key -Name $name -Value $value -PropertyType $type -Force | Out-Null
		}
		#Write-host $key $name $value ' created'
		
	 Else {
		New-ItemProperty -Path $key -Name $name -Value $value -PropertyType $type -Force | Out-Null
		}
		#Write-host 'Key '$name ' changed to ' $value
		
	} 

# Grab BlackViper's Service Settings 
## Disables unnecessary services, probably not needed most of the time
#(New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/madbomb122/BlackViperScript/master/BlackViper-Win10.ps1', 'c:\downloads\BlackViper-Win10.ps1')
#(New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/madbomb122/BlackViperScript/master/BlackViper.csv', 'c:\downloads\BlackViper.csv')
#c:\downloads\BlackViper-Win10.ps1 -atos -auto -safe -min -bcsc -baf 


# Remove unused windows Apps
## To remove all Apps
### Get-AppxPackage -allusers | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.WindowsDVDPlayer | Remove-AppxPackage | Out-Null
Get-AppxPackage -allusers Microsoft.WindowsPhone | Remove-AppxPackage | Out-Null
Get-AppxPackage -allusers Microsoft.Appconnector | Remove-AppxPackage | Out-Null
Get-AppxPackage -allusers Microsoft.People| Remove-AppxPackage | Out-Null
Get-AppxPackage -allusers E046963F.LenovoCompanion | Remove-AppxPackage | Out-Null
Get-AppxPackage -allusers Microsoft.XboxIdentityProvider | Remove-AppxPackage | Out-Null
Get-AppxPackage -allusers 9E2F88E3.Twitter | Remove-AppxPackage | Out-Null
Get-AppxPackage -allusers Microsoft.MicrosoftOfficeHub | Remove-AppxPackage | Out-Null
Get-AppxPackage -allusers Microsoft.NET.Native.Framework.1.2 | Remove-AppxPackage | Out-Null
Get-AppxPackage -allusers Microsoft.NET.Native.Framework.1.2 | Remove-AppxPackage | Out-Null
Get-AppxPackage -allusers Microsoft.Messaging| Remove-AppxPackage | Out-Null
Get-AppxPackage -allusers Microsoft.XboxSpeechToTextOverlay| Remove-AppxPackage | Out-Null
Get-AppxPackage -allusers Microsoft.Wallet | Remove-AppxPackage | Out-Null
Get-AppxPackage -allusers Microsoft.XboxGameOverlay| Remove-AppxPackage | Out-Null
Get-AppxPackage -allusers Microsoft.ZuneMusic| Remove-AppxPackage | Out-Null
Get-AppxPackage -allusers Microsoft.OneConnect | Remove-AppxPackage | Out-Null
Get-AppxPackage -allusers Microsoft.VCLibs.140.00.UWPDesktop | Remove-AppxPackage | Out-Null
Get-AppxPackage -allusers Microsoft.Microsoft3DViewer| Remove-AppxPackage | Out-Null
Get-AppxPackage -allusers Microsoft.WindowsMaps| Remove-AppxPackage | Out-Null
Get-AppxPackage -allusers Microsoft.WindowsFeedbackHub | Remove-AppxPackage | Out-Null
Get-AppxPackage -allusers Microsoft.XboxApp| Remove-AppxPackage | Out-Null
Get-AppxPackage -allusers Microsoft.SkypeApp | Remove-AppxPackage | Out-Null
Get-AppxPackage -allusers Microsoft.ZuneVideo| Remove-AppxPackage | Out-Null
Get-AppxPackage -allusers Microsoft.WindowsAlarms| Remove-AppxPackage | Out-Null
Get-AppxPackage -allusers Microsoft.BingSports | Remove-AppxPackage | Out-Null
Get-AppxPackage -allusers Microsoft.BingFinance| Remove-AppxPackage | Out-Null
Get-AppxPackage -allusers Microsoft.BingNews | Remove-AppxPackage | Out-Null
Get-AppxPackage -allusers Microsoft.BingWeather| Remove-AppxPackage | Out-Null
Get-AppxPackage -allusers Microsoft.WindowsSoundRecorder | Remove-AppxPackage | Out-Null
Get-AppxPackage -allusers king.com.CandyCrushSaga| Remove-AppxPackage | Out-Null
Get-AppxPackage -allusers Microsoft.WindowsCamera| Remove-AppxPackage | Out-Null
Get-AppxPackage -allusers microsoft.windowscommunicationsapps | Remove-AppxPackage | Out-Null


#Download required software
Write-host ' Create download directory'
New-Item c:\downloads -type directory -ErrorAction SilentlyContinue
Write-host ' Download and run github'
(New-Object System.Net.WebClient).DownloadFile('https://central.github.com/deployments/desktop/desktop/latest/win32', 'c:\downloads\github.exe')
c:\downloads\github.exe
Write-host ' Download and run ninite installer'
(New-Object System.Net.WebClient).DownloadFile('https://ninite.com/7zip-chrome-classicstart-firefox-foxit-klitecodecs-notepadplusplus-paint.net-pidgin-putty-steam-teamviewer12-vlc-windirstat-winmerge-winscp/ninite.exe', 'c:\downloads\ninite.exe')
c:\downloads\ninite.exe
Write-host ' Download and install Bulk Rename Utility'
(New-Object System.Net.WebClient).DownloadFile('http://www.bulkrenameutility.co.uk/Downloads/BRU_setup.exe', 'c:\downloads\BRU_setup.exe')
c:\downloads\BRU_setup.exe
Write-host ' Download and install VPN Software'
(New-Object System.Net.WebClient).DownloadFile('https://downloads.nordcdn.com/apps/windows/10/NordVPN/latest/NordVPNSetup.exe', 'c:\downloads\NordVPNSetup.exe')
c:\downloads\NordVPNSetup.exe
Write-host ' Download and install Python 2.7'
(New-Object System.Net.WebClient).DownloadFile('https://www.python.org/ftp/python/2.7.13/python-2.7.13.msi', 'c:\downloads\python-2.7.13.msi')
c:\downloads\python-2.7.13.msi
Write-host ' Download and install Spybot'
(New-Object System.Net.WebClient).DownloadFile('https://download.spybot.info/AntiBeacon/Portable/SpybotAntiBeaconPortable-safer-networking.org_1.6_Dev_Test_4.paf.exe', 'c:\downloads\spybot.exe')
c:\downloads\spybot.exe
Write-host ' Download and install Cura'
start https://ultimaker.com/en/products/cura-software/list


Write-host ' Enable HKCR in powershell'
New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT| Out-Null


Write-host ' Show hidden files and extensions'
$key = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'
SetItem Hidden 1
SetItem HideFileExt 0
SetItem ShowSuperHidden 1
SetItem DontPrettyPath 1
SetItem Start_NotifyNewApps -value 0

Write-host ' Disable Java Sponsors and Updates'
$key = 'HKCU:\SOFTWARE\JavaSoft' 
SetItem SPONSORS 'DISABLE' 'String'
$key = 'HKCU:\SOFTWARE\Wow6432Node\JavaSoft' 
SetItem SPONSORS 'DISABLE' 'String'
$key = 'HKCU:\SOFTWARE\JavaSoft\Java Update\Policy'
SetItem EnableJavaUpdate 00000000
$key = 'HKCU:\SOFTWARE\Wow6432Node\JavaSoft\Java Update\Policy'
SetItem EnableJavaUpdate 00000000
SetItem NotifyDownload 00000000
SetItem PostStatusUrl 00000000
SetItem UpdateMin 00000000
SetItem Frequency 00000000


Write-host ' Supress boot popups'
$key = 'HKCU:\SYSTEM\CurrentControlSet\Control\Windows' 
SetItem NoPopupsOnBoot 1

Write-host ' Remove user folders from Computer'
Remove-Item HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\* -Recurse -ErrorAction SilentlyContinue

Write-host ' Remove user folders from Explorer'
Remove-Item HKCU:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\* -Recurse -ErrorAction SilentlyContinue

Write-host ' Keep Taskbar icons from Grouping'
$key = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' 
SetItem TaskbarGlomming 0

Write-host ' Disable Search the Internet for program to open filetype'
$key = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer' 
SetItem InternetOpenWith 1

Write-host ' Disable check for solution to unexpected closing of application'
$key = 'HKCU:\SOFTWARE\Microsoft\Windows\Windows Error Reporting\'
SetItem 'Disabled' 1
SetItem AutoApproveOSDumps 0
SetItem DisableArchive 0
SetItem DontSendAdditionalData 1
SetItem DontShowUI 1
SetItem LoggingDisabled 1
Set-Service WerSvc -StartupType disabled

Write-host ' Set all folders to details view'
$key = 'HKCU:\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\AllFolders\Shell\' 
SetItem FolderType 'Documents' 'String'

Write-host ' Remove OneDrive'
$key = 'HKCR:\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}'
SetItem System.IsPinnedToNameSpaceTree 00000000 
$key = 'HKCR:\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}' 
SetItem System.IsPinnedToNameSpaceTree 0000000
$key = 'HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\OneDrive' 
SetItem DisableFileSyncNGSC 1

Write-host ' Turn Cortana off and block access'
$key = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Search\' 
SetItem SearchboxTaskbarMode 0
$key = 'HKCU:\SOFTWARE\Policies\Microsoft\Windows\Windows Search' 
SetItem AllowCortana 0 
Get-NetFirewallRule | where {$_.DisplayGroup -like '*Microsoft*Windows*Cortana*'} | Enable-NetFirewallRule
Get-NetFirewallRule -DisplayGroup 'Cortana' | Enable-NetFirewallRule


#Setup taskbar, 
Remove-Item $env:APPDATA'\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\*' | Out-Null
Remove-Item HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband\* -Recurse | Out-Null
$key = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People'
SetItem PeopleBand 0

Stop-Process -processname explorer