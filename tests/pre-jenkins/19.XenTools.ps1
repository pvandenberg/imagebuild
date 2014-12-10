# Collect baseline test values prior to Jenkins run.
# XenTools installed and service running

$xenagent="C:\Program Files (x86)\Citrix\XenTools\XenGuestAgent.exe"
$xenagent64="C:\Program Files\Citrix\XenTools\XenGuestAgent.exe"
$FileExists = Test-Path $xenagent
$FileExists2 = Test-Path $xenagent64
If (($FileExists -eq $True) -OR ($FileExists2 -eq $True)) {
	Write-Host "OK: 19 - pre #XenGuestAgent: Agent is installed."
	}
Else {
	Write-Host "NOK: 19 - pre #XenGuestAgent: Agent is not installed."
	}

If([bool](Get-Process XenGuestAgent) -eq $True)	{
 	Write-Host "OK: 19 - pre #XenGuestAgent: Agent Service is running."
	} 
Else {
 	Write-Host "NOK: 19 - pre #XenGuestAgent: Agent Service is not running."
	}
