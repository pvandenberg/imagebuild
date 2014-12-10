echo 'all Baseline stuff'
Rem Cleanup initial WSUS stuff.
net stop wuauserv
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate" /v SusClientId /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate" /v SusClientValidation /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\SLS" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\SLS" /f
rmdir /S /Q C:\Windows\SoftwareDistribution\Download
mkdir C:\Windows\SoftwareDistribution\Download

REM inject default WSUS stuff

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU"
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v AUOptions /d 4 /t REG_DWORD /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v AUPowerManagement /d 1 /t REG_DWORD /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v AutoInstallMinorUpdates /d 1 /t REG_DWORD /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v DetectionFrequency /d 10 /t REG_DWORD /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v DetectionFrequencyEnabled /d 1 /t REG_DWORD /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v IncludeRecommendedUpdates /d 1 /t REG_DWORD /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAUAsDefaultShutdownOption /d 1 /t REG_DWORD /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAUShutdownOption /d 1 /t REG_DWORD /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoRebootWithLoggedOnUsers /d 0 /t REG_DWORD /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /d 0 /t REG_DWORD /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v RebootRelaunchTimeout /d 10 /t REG_DWORD /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v RebootRelaunchTimeoutEnabled /d 1 /t REG_DWORD /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v RescheduleWaitTime /d 10 /t REG_DWORD /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v RescheduleWaitTimeEnabled /d 1 /t REG_DWORD /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v ScheduledInstallDay /d 0 /t REG_DWORD /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v ScheduledInstallTime /d 3 /t REG_DWORD /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v UseWUServer /d 1 /t REG_DWORD /f

net start wuauserv

REM Enable RDP
netsh advfirewall firewall add rule name="Open Port 3389" dir=in action=allow protocol=TCP localport=3389
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f

REM Disable Auto Logon
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoAdminLogon /d 0 /f

REM Install Hypervisor Tooling   -- Under construction --
powershell -File "A:\Xentools.ps1"

REM Install Security Baseline
Secedit /configure /db secedit.sdb /cfg "A:\SBP2012.inf"
powershell -file "A:\security_baseline.ps1"


REM Increase Disk Timeout, CHECK when Reset!
reg add "HKLM\SYSTEM\CurrentControlSet\services\Disk" /v TimeOutValue /d 190 /f

REM Disable Firewall
netsh advfirewall set allprofiles state off

REM Restrict RPC Ports 5001-6000
reg add "HKLM\Software\Microsoft\Rpc\Internet" /f
reg add "HKLM\Software\Microsoft\Rpc\Internet" /v Ports /t REG_MULTI_SZ /d 5001-6000 /f
reg add "HKLM\Software\Microsoft\Rpc\Internet" /v PortsInternetAvailable /d Y /f
reg add "HKLM\Software\Microsoft\Rpc\Internet" /v UseInternetPorts /d Y /f

REM Disable NETBIOS via TCP/IP
powershell -command "& {((Get-WMIObject Win32_NetworkadapterConfiguration | where {$_.IPEnabled -eq 'True'})).settcpipnetbios(2)}" > null

REM Disable LRO Citrix  -- SHOULD BE SET IN POLICY, HYPERVISOR AGNOSTIC -- 

REM Disable IPv6
reg add "HKLM\SYSTEM\CurrentControlSet\services\TCPIP6\Parameters" /v DisabledComponents /t REG_DWord /d 0xffffffff

REM Enable Telnet Client
powershell -command "& {ipmo Servermanager ; Add-WindowsFeature 'Telnet-Client'}" > null

REM Set Powerscheme to High Performance
powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c

REM Disable Windows Error Reporting
powershell -command "& {Disable-WindowsErrorReporting}"

REM Set Startup and Recovery Settings
BCDEDIT /timeout 10
powershell -command "& {$osrecoveryconf = (Get-WmiObject Win32_OSRecoveryConfiguration) ; $osrecoveryconf.AutoReboot = [bool]1 ; $osrecoveryconf.DebugInfoType = [uint32]3 ; $osrecoveryconf.Put() }" > null

REM Run Pre-Jenkins test to collect defaults.
powershell -file "A:\run-pretests.ps1"

REM Cleanup afterwards...
mkdir %WINDIR%\Setup\Scripts
mkdir C:\PostInstall
copy A:\cleanup.ps1 C:\PostInstall 
echo powershell -NonInteractive -WindowStyle Hidden -File "C:\PostInstall\cleanup.ps1" >%WINDIR%\Setup\Scripts\SetupComplete.cmd



