# Does initial windows configuration
# To kick this off run the next line uncommented at an Administrator Powershell Prompt
# Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/zedd00/Windows_Fixes/master/Windows_Fix.PS1'))
# If you need to make changes, run these 3 lines, make changes, then run the 4th line
# New-Item c:\downloads -type directory
# wget "https://raw.githubusercontent.com/zedd00/Windows_Fixes/master/Windows_Fix.PS1" -outfile "c:\downloads\Windows_Fix.PS1"
# set-executionpolicy unrestricted 
# c:\downloads\Windows_Fix.PS1


# If the machine has a larger D drive, set this to yes before running
$HasDdrive='no'
# If this is for home, install different stuff
$HomeMachine='no'


# Grab BlackViper's Service Settings 
## Disables unnecessary services, probably not needed most of the time
# New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/madbomb122/BlackViperScript/master/BlackViper-Win10.ps1', 'c:\downloads\BlackViper-Win10.ps1')
# (New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/madbomb122/BlackViperScript/master/BlackViper.csv', 'c:\downloads\BlackViper.csv')
# c:\downloads\BlackViper-Win10.ps1 -atos -auto -safe -min -bcsc -baf 

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

# Remove unused windows Apps
## To remove all Apps
### Get-AppxPackage -allusers | Remove-AppxPackage
Function Remove-AppxBloat {
    [CmdletBinding()]
    Param(
        [ValidateSet('Whitelist','Blacklist')]
        [string]$Method = 'Whitelist'
    )
    If ($Method -eq 'Whitelist') {
        [regex]$Whitelist = "1527c705-839a-4832-9118-54d4Bd6a0c89|c5e2524a-ea46-4f67-841f-6a9465d9d515|F46D4000-FD22-4DB4-AC8E-4E1DDDE828FECortanaListenUIApp|DesktopLearning|DesktopView|E2A4F912-2574-4A75-9BB0-0D023378592B|EnvironmentsApp|FileManager|HoloCamera|HoloItemPlayerApp|HoloShell|InputApp|Microsoft.AAD.BrokerPlugin|Microsoft.AccountsControl||Microsoft.Appconnector|Microsoft.BioEnrollment|Microsoft.CredDialogHost|Microsoft.DesktopAppInstaller|Microsoft.ECApp|Microsoft.HEVCVideoExtension|Microsoft.LockApp|Microsoft.Media.PlayReadyClient|Microsoft.MicrosoftEdge|Microsoft.MoCamera|Microsoft.MSPaint|Microsoft.NET.Native.Framework|Microsoft.NET.Native.Runtime|Microsoft.PPIProjection|Microsoft.Services.Store.Engagement|Microsoft.Services.Store.Engagement|Microsoft.StorePurchaseApp|Microsoft.VCLibs|Microsoft.Windows.Apprep.ChxApp|Microsoft.Windows.AssignedAccessLockApp|Microsoft.Windows.CloudExperienceHost|Microsoft.Windows.ContentDeliveryManager|Microsoft.Windows.Cortana|Microsoft.Windows.ModalSharePickerHost|Microsoft.Windows.OOBENetworkCaptivePortal|Microsoft.Windows.OOBENetworkConnectionFlow|Microsoft.Windows.ParentalControls|Microsoft.Windows.PeopleExperienceHost|Microsoft.Windows.Photos|Microsoft.Windows.PinningConfirmationDialog|Microsoft.Windows.SecondaryTileExperience|Microsoft.Windows.SecureAssessmentBrowser|Microsoft.Windows.ShellExperienceHost|Microsoft.WindowsAlarms|Microsoft.WindowsCalculator|Microsoft.WindowsCamera|Microsoft.WindowsMaps|Microsoft.Windows.SecHealthUI|Microsoft.WindowsSoundRecorder|Microsoft.Windows.WindowPicker|Microsoft.WindowsStore|Microsoft.WinJS|Microsoft.XboxGameCallableUI|Microsoft.XboxGameOverlay|Microsoft.XboxIdentityProvider|Microsoft.XboxSpeechToTextOverlay|windows.devicesflow|windows.immersivecontrolpanel|Windows.MiracastView|Windows.PrintDialog|Windows.PurchaseDialog|winstore"
        Write-Verbose 'Starting to remove provisioned packages'
        Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -NotMatch $Whitelist} | Remove-AppxProvisionedPackage -Online | Out-Null
        Write-Verbose 'Starting to remove packages from all users'
        Get-AppxPackage -AllUsers | Where-Object {$_.Name -NotMatch $Whitelist} | Remove-AppxPackage | Out-Null
        Write-Output 'Successfully completed removal of all AppX Packages not specified in the whitelist'
    } Else {
        [regex]$Blacklist = "9E2F88E3.Twitter|A278AB0D.MarchofEmpires|ClearChannelRadioDigital.iHeartRadio|Facebook.Facebook|Flipboard.Flipboard|king.com.CandyCrushSaga|king.com.CandyCrushSodaSaga|Microsoft.3DBuilder|Microsoft.BingFinance|Microsoft.BingFoodAndDrink|Microsoft.BingHealthAndFitness|Microsoft.BingNews|Microsoft.BingSports|Microsoft.BingTranslator|Microsoft.BingTravel|Microsoft.BingWeather|Microsoft.CommsPhone|Microsoft.FreshPaint|Microsoft.GetHelp|Microsoft.Getstarted|Microsoft.Microsoft3DViewer|Microsoft.MicrosoftJackpot|Microsoft.MicrosoftJigsaw|Microsoft.MicrosoftOfficeHub|Microsoft.MicrosoftSolitaireCollection|Microsoft.MicrosoftSudoku|Microsoft.MinecraftUWP|Microsoft.MovieMoments|Microsoft.Office.OneNote|Microsoft.Office.Sway|Microsoft.People|Microsoft.Print3D|Microsoft.SkypeApp|Microsoft.SkypeWiFi|Microsoft.Studios.Wordament|Microsoft.Taptiles|microsoft.windowscommunicationsapps|Microsoft.WindowsFeedback|Microsoft.WindowsFeedbackHub|Microsoft.WindowsPhone|Microsoft.Xbox.TCUI|Microsoft.XboxApp|Microsoft.ZuneMusic|Microsoft.ZuneVideo|MicrosoftMahjong|ShazamEntertainmentLtd.Shazam|TheNewYorkTimes.NYTCrossword"
        Write-Verbose 'Starting to remove provisioned packages'
        Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -Match $Blacklist} | Remove-AppxProvisionedPackage -Online | Out-Null
        Write-Verbose 'Starting to remove packages from all users'
        Get-AppxPackage -AllUsers | Where-Object {$_.Name -Match $Blacklist} | Remove-AppxPackage | Out-Null
        Write-Output 'Successfully completed removal of all AppX Packages specified in the blacklist'
    }
}

# Remove Default Windows Apps
Remove-AppxBloat Whitelist

#Allow secure connections
[Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls"


Write-host ' Create download directory'
New-Item c:\downloads -type directory -ErrorAction SilentlyContinue

# Chocolatey is a package manager for Windows
Write-host ' Download and run Chocolatey'
If(-not(Test-Path -Path "$env:ProgramData\Chocolatey")) 
	{
	(New-Object System.Net.WebClient).DownloadFile('https://chocolatey.org/install.ps1', 'c:\downloads\choco-install.ps1')
	c:\downloads\choco-install.ps1
	}
# Download software for home
If($HomeMachine -eq "yes")
	{
	Write-host 'Installing home software'
	$Packages = 'github-desktop','nordvpn','slack','googlechrome','firefox','brave' 

		ForEach ($PackageName in $Packages)
		{
			choco upgrade $PackageName -y
		}

	Write-host 'Download and install Spybot'
	(New-Object System.Net.WebClient).DownloadFile('https://download.spybot.info/AntiBeacon/Portable/SpybotAntiBeaconPortable-safer-networking.org_1.6_Dev_Test_4.paf.exe', 'c:\downloads\spybot.exe')
	c:\downloads\spybot.exe
	}

#Download software 

# Add public choco repo
If($HomeMachine -eq "no")
	{ 
	choco source add -n='public' -s='https://chocolatey.org/api/v2'
	}
$Packages = 'notepadplusplus','npppluginmanager','python2','python3','windirstat','lastpass','bulkrenameutility','7zip','displayfusion','mobaxterm'
	ForEach ($PackageName in $Packages)
	{
		choco upgrade $PackageName -y
	}

Write-host 'Download and install mouse driver'
(New-Object System.Net.WebClient).DownloadFile('http://dl.elecom.co.jp/support/download/peripheral/mouse/assistant/win/mouse_driver_ma516000.zip', 'c:\downloads\mouse.zip')
7z e c:\downloads\mouse.zip -oC:\downloads -y
c:\downloads\mouse_driver_ma516000.exe

Write-host 'Copy Notepad++ Settings'

$nppconfig= 'config.xml','contextMenu.xml','langs.xml','shortcuts.xml','stylers.xml','userDefineLang.xml'
	ForEach ($ConfigName in $nppconfig)
	{
	$dlroot="https://raw.githubusercontent.com/zedd00/Windows_Fixes/master/$ConfigName"
	$nppath="C:\Program Files\Notepad++\$ConfigName"
		(New-Object System.Net.WebClient).DownloadFile($dlroot, $nppath)
	}

Write-host 'Add these Notepad++ Plugins'
Write-host 'Explorer'
Write-host 'markdown++'
Write-host 'bracketsCheck'
Write-host 'reloadButton'
Write-host 'nppftp'
Write-host 'Add erb to coffeescript'

Read-Host -Prompt "Once all of the software is installed, press Enter to continue"

Write-host ' Disable Hibernation'
powercfg.exe /hibernate off


Write-host ' Enable HKCR in powershell'
New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT| Out-Null

Write-host ' Set Notepad++ as default editor'
$key = "HKCR:\Unknown\shell\notepad\"
SetItem "(Default)" "Open with Notepad" string
$key = "HKCR:\Unknown\shell\notepad\command\"
SetItem "(Default)" 'C:\Program Files (x86)\Notepad++\notepad++.exe "%1"' expandstring


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

