# Does initial windows configuration
# To kick this off run the next 4 lines uncommented at an Administrator Powershell Prompt
# New-Item c:\downloads -type directory
# wget "https://raw.githubusercontent.com/zedd00/Windows_Fixes/master/Windows_Fix.PS1" -outfile "c:\downloads\Windows_Fix.PS1"
# set-executionpolicy unrestricted 
# c:\downloads\Windows_Fix.PS1

# If the machine has a larger D drive, set this to yes before running
$HasDdrive='no'

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
	
#List of registry types, and what they corrispond to in regedit	
#Binary	REG_BINARY
#DWord	REG_DWORD
#ExpandString	REG_EXPAND_SZ
#MultiString	REG_MULTI_SZ
#QWord	REG_QWORD
#String	REG_SZ	

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
Get-AppxPackage -allusers 89006A2E.AutodeskSketchBook| Remove-AppxPackage | Out-Null
Get-AppxPackage -allusers A278AB0D.DisneyMagicKingdoms| Remove-AppxPackage | Out-Null
Get-AppxPackage -allusers A278AB0D.MarchofEmpires| Remove-AppxPackage | Out-Null
Get-AppxPackage -allusers DolbyLaboratories.DolbyAccess| Remove-AppxPackage | Out-Null
Get-AppxPackage -allusers king.com.CandyCrushSodaSaga| Remove-AppxPackage | Out-Null
Get-AppxPackage -allusers Microsoft.BingNews| Remove-AppxPackage | Out-Null
Get-AppxPackage -allusers Microsoft.Getstarted| Remove-AppxPackage | Out-Null
Get-AppxPackage -allusers Microsoft.MicrosoftStickyNotes| Remove-AppxPackage | Out-Null
Get-AppxPackage -allusers Microsoft.Office.OneNote| Remove-AppxPackage | Out-Null
Get-AppxPackage -allusers Microsoft.Print3D| Remove-AppxPackage | Out-Null
Get-AppxPackage -allusers Microsoft.Xbox.TCUI| Remove-AppxPackage | Out-Null
Get-AppxPackage -allusers Microsoft.XboxGamingOverlay| Remove-AppxPackage | Out-Null

#Allow secure connections
[Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls"

#Download required software
Write-host ' Create download directory'
New-Item c:\downloads -type directory -ErrorAction SilentlyContinue
Write-host ' Download and run github'
(New-Object System.Net.WebClient).DownloadFile('https://central.github.com/deployments/desktop/desktop/latest/win32', 'c:\downloads\github.exe')
c:\downloads\github.exe
Write-host ' Download and run ninite installer'
(New-Object System.Net.WebClient).DownloadFile('https://ninite.com/7zip-chrome-classicstart-firefox-foxit-klitecodecs-notepadplusplus-paint.net-pidgin-putty-teamviewer12-vlc-windirstat-winmerge-winscp/ninite.exe', 'c:\downloads\ninite.exe')
c:\downloads\ninite.exe
Write-host ' Download and install Bulk Rename Utility'
(New-Object System.Net.WebClient).DownloadFile('http://www.bulkrenameutility.co.uk/Downloads/BRU_setup.exe', 'c:\downloads\BRU_setup.exe')
c:\downloads\BRU_setup.exe
Write-host ' Download and install VPN Software'
(New-Object System.Net.WebClient).DownloadFile('https://downloads.nordcdn.com/apps/windows/10/NordVPN/latest/NordVPNSetup.exe', 'c:\downloads\NordVPNSetup.exe')
c:\downloads\NordVPNSetup.exe
Write-host ' Download and install Python 2.7'
(New-Object System.Net.WebClient).DownloadFile('http://www.python.org/ftp/python/2.7.13/python-2.7.13.msi', 'c:\downloads\python-2.7.13.msi')
c:\downloads\python-2.7.13.msi
Write-host ' Download and install Spybot'
(New-Object System.Net.WebClient).DownloadFile('https://download.spybot.info/AntiBeacon/Portable/SpybotAntiBeaconPortable-safer-networking.org_1.6_Dev_Test_4.paf.exe', 'c:\downloads\spybot.exe')
c:\downloads\spybot.exe
#Write-host ' Download and install Cura'
#start https://ultimaker.com/en/products/cura-software/list
Write-host ' Download and install Slack'
(New-Object System.Net.WebClient).DownloadFile('https://slack.com/ssb/download-win64', 'c:\downloads\slack.exe')
c:\downloads\slack.exe
Write-host ' Download and install plexamp'
(New-Object System.Net.WebClient).DownloadFile('https://plexamp.plex.tv/plexamp.plex.tv/Plexamp%20Setup%201.0.5.exe', 'c:\downloads\plexamp.exe')
c:\downloads\plexamp.exe
Write-host ' Download and install display fusion'
(New-Object System.Net.WebClient).DownloadFile('https://www.binaryfortress.com/Data/Download/?package=displayfusion&log=101', 'c:\downloads\df.exe')
c:\downloads\df.exe
Write-host ' Download and install display fusion'
(New-Object System.Net.WebClient).DownloadFile('https://swupdate.openvpn.org/community/releases/openvpn-install-2.4.6-I602.exe' 'c:\downloads\openvpn.exe')
c:\downloads\openvpn.exe
(New-Object System.Net.WebClient).DownloadFile('https://nssm.cc/release/nssm-2.24.zip', 'c:\downloads\nssm.zip')
c:\downloads\nssm.zip

Read-Host -Prompt "Once all of the software is installed, press Enter to continue"

#Notepad++ Plugins
Write-host ' Download and install notepad++ package manager'
(New-Object System.Net.WebClient).DownloadFile('https://github.com/bruderstein/nppPluginManager/releases/download/v1.4.11/PluginManager_v1.4.11_UNI.zip', 'c:\downloads\npp-package.zip')
7z x c:\downloads\npp-package.zip 'C:\Program Files (x86)\Notepad++'

#Explorer
#markdown++
#bracketsCheck
#reloadButton
#nppftp
#Add erb to coffeescript


Write-host ' Disable Hibernation'
powercfg.exe /hibernate off


Write-host ' Enable HKCR in powershell'
New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT| Out-Null

Write-host ' Set Notepad++ as default editor'
$key = "HKCR:\Unknown\shell\notepad\"
SetItem "(Default)" "Open with Notepad" string
$key = "HKCR:\Unknown\shell\notepad\command\"
SetItem "(Default)" 'C:\Program Files (x86)\Notepad++\notepad++.exe "%1"' expandstring

Write-host ' Set Python Path'
$oldpath = (Get-ItemProperty -Path '˜Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH).path
$newpath = '$oldpath;c:\python27'
Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH -Value $newPath

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
Remove-Item HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\* -Recurse -ErrorAction SilentlyContinue
$key = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager'
SetItem SystemPaneSuggestionsEnabled 0
SetItem OemPreInstalledAppsEnabled 0
SetItem PreInstalledAppsEnabled 0
SetItem PreInstalledAppsEverEnabled 0
SetItem SilentInstalledAppsEnabled 0
$key = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{f42ee2d3-909f-4907-8871-4c22fc0bf756}\PropertyBag'
SetItem 'ThisPCPolicy' 'Hide' 'String'
$key = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{0ddd015d-b06c-45d5-8c4c-f59713854639}\PropertyBag'
SetItem 'ThisPCPolicy' 'Hide' 'String'
$key = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{35286a68-3c57-41a1-bbb1-0eae73d76c95}\PropertyBag'
SetItem 'ThisPCPolicy' 'Hide' 'String'
$key = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{7d83ee9b-2244-4e70-b1f5-5393042af1e4}\PropertyBag'
SetItem 'ThisPCPolicy' 'Hide' 'String'
$key = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{a0c69a99-21c8-4671-8703-7934162fcf1d}\PropertyBag'
SetItem 'ThisPCPolicy' 'Hide' 'String'
$key = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}\PropertyBag'
SetItem 'ThisPCPolicy' 'Hide' 'String'
$key = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{24D89E24-2F19-4534-9DDE-6A6671FBB8FE}\PropertyBag'
SetItem 'ThisPCPolicy' 'Hide' 'String'
$key = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{31C0DD25-9439-4F12-BF41-7FF4EDA38722}\PropertyBag'
SetItem 'ThisPCPolicy' 'Hide' 'String'

If($HasDdrive -eq 'yes')
	{
	Write-host ' Move things to D drive'
	Remove-Item -path 'C:\Users\zedd\Documents\GitHub'
	Remove-Item -path 'C:\Users\Public\Documents\Hyper-V\Virtual hard disks'
	New-Item -ItemType SymbolicLink -Path 'C:\Users\zedd\Documents\GitHub' -Target 'D:\GitHub' | Out-Null
	New-Item -ItemType SymbolicLink -Path 'C:\Users\Public\Documents\Hyper-V\Virtual hard disks' -Target 'D:\Hyper-V' 
	$key = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders' 
	SetItem '{374DE290-123F-4565-9164-39C4925E467B}' 'D:\Library\Downloads' 'String'
	SetItem '{4C5C32FF-BB9D-43B0-B5B4-2D72E54EAAA4}' 'D:\Library\Saved Games' 'String'
	SetItem '{56784854-C6CB-462B-8169-88E350ACB882}' 'D:\Library\Contacts' 'String'
	SetItem Favorites 'D:\Library\Favorites' 'String'
	SetItem 'My Music' 'D:\Library\Music' 'String'
	SetItem 'My Pictures' 'D:\Library\Pictures' 'String'
	SetItem 'My Videos' 'D:\Library\Videos' 'String'
	SetItem Personal 'D:\Library\Documents' 'String'
	$key = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders'  
	SetItem '{374DE290-123F-4565-9164-39C4925E467B}' 'D:\Library\Downloads' 'String'
	SetItem '{4C5C32FF-BB9D-43B0-B5B4-2D72E54EAAA4}' 'D:\Library\Saved Games' 'String'
	SetItem '{56784854-C6CB-462B-8169-88E350ACB882}' 'D:\Library\Contacts' 'String'
	SetItem Favorites 'D:\Library\Favorites' 'String'
	SetItem 'My Music' 'D:\Library\Music' 'String'
	SetItem 'My Pictures' 'D:\Library\Pictures' 'String'
	SetItem 'My Videos' 'D:\Library\Videos' 'String'
	SetItem Personal 'D:\Library\Documents' 'String'
	}
	
Write-host ' Remove user folders from Explorer'
Remove-Item HKCU:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\* -Recurse -ErrorAction SilentlyContinue

Write-host ' Remove programs from right click menu'
Remove-Item -literalpath 'HKCR:\*\shellex\ContextMenuHandlers\ FileSyncEx' -ErrorAction SilentlyContinue
Remove-Item -literalpath 'HKCR:\*\shellex\ContextMenuHandlers\EPP ' -ErrorAction SilentlyContinue
Remove-Item -literalpath 'HKCR:\*\shellex\ContextMenuHandlers\Foxit_ConvertToPDF_Reader' -ErrorAction SilentlyContinue
Remove-Item -literalpath 'HKCR:\*\shellex\ContextMenuHandlers\ModernSharing' -ErrorAction SilentlyContinue
Remove-Item -literalpath 'HKCR:\*\shellex\ContextMenuHandlers\Open With EncryptionMenu' -ErrorAction SilentlyContinue
Remove-Item -literalpath 'HKCR:\*\shellex\ContextMenuHandlers\Sharing' -ErrorAction SilentlyContinue
Remove-Item -literalpath 'HKCR:\*\shellex\ContextMenuHandlers\WinMerge' -ErrorAction SilentlyContinue
Remove-Item -literalpath 'HKCR:\*\shellex\ContextMenuHandlers\WorkFolders' -ErrorAction SilentlyContinue
Remove-Item -literalpath 'HKCR:\AllFilesystemObjects\shellex\ContextMenuHandlers\SendTo' -ErrorAction SilentlyContinue


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
taskkill /f /im OneDrive.exe
c:\windows\SysWOW64\OneDriveSetup.exe /uninstall
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