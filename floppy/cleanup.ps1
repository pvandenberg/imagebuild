# Uninstall OpenSSH
Stop-Service "OpenSSHd" -Force
CMD /C "C:\Program Files\OpenSSH\Uninstall.exe" /S
sleep 3

# Removing firewall rules
Write-Host "Removing OpenSSH firewall configuration"
netsh advfirewall firewall delete rule name="SSHD"
netsh advfirewall firewall delete rule name="ssh"

# Cleanup Install stuff
Remove-Item -Recurse -Path "C:\PostInstall" -Force
Remove-Item -Recurse -Path "C:\Users\Public" -Force
Remove-Item -Recurse -Force "C:\Windows\Setup\Scripts" 
CMD /C net user /DELETE sshd_server
CMD /C net user /DELETE sbp_build 
(Get-WmiObject Win32_UserProfile | ?{$_.LocalPath -like '*sshd_server'}).Delete()
(Get-WmiObject Win32_UserProfile | ?{$_.LocalPath -like '*sbp_build*'}).Delete()
CMD /C reg delete "HKLM\SOFTWARE\Cygwin" /f
CMD /C reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v InstallWindowsUpdates /f
