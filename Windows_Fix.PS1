# set-executionpolicy unrestricted 
# in powershell to make the magic happen

#Show hidden files and extensions
$key = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'
Set-ItemProperty $key Hidden 1
Set-ItemProperty $key HideFileExt 0
Set-ItemProperty $key ShowSuperHidden 1

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

# Enable HKCR in powershell
New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT

# Remove OneDrive from explorer
Set-ItemProperty HKCR:\CLSID\'{018D5C66-4533-4307-9B53-224DE2ED1FE6}' System.IsPinnedToNameSpaceTree 00000000 -Force
Set-ItemProperty HKCR:\Wow6432Node\CLSID\'{018D5C66-4533-4307-9B53-224DE2ED1FE6}' System.IsPinnedToNameSpaceTree 0000000

# Restart Explorer
Stop-Process -processname explorer

#Download required software
##Create download directory
New-Item c:\downloads -type directory
## Download and run ninite installer
wget "https://ninite.com/7zip-chrome-classicstart-firefox-foxit-klitecodecs-notepadplusplus-paint.net-pidgin-putty-steam-teamviewer12-vlc-windirstat-winmerge-winscp/ninite.exe" -outfile "c:\downloads\ninite.exe"
c:\downloads\ninite.exe
## Download and install Bulk Rename Utility
wget "http://www.bulkrenameutility.co.uk/Downloads/BRU_setup.exe" -outfile "c:\downloads\BRU_setup.exe"
c:\downloads\BRU_setup.exe
## Download and install VPN Software
wget "https://downloads.nordcdn.com/apps/windows/10/NordVPN/latest/NordVPNSetup.exe" -outfile "c:\downloads\NordVPNSetup.exe"
c:\downloads\NordVPNSetup.exe
wget "https://www.python.org/ftp/python/2.7.13/python-2.7.13.msi" -outfile "c:\downloads\python-2.7.13.msi"
c:\downloads\python-2.7.13.msi
