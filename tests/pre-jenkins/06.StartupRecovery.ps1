# Collect baseline test values prior to Jenkins run.
# Current System Recovery Setting

$startuptimeout = ((bcdedit /enum BOOTMGR) -Match "timeout")[0].Replace("timeout", "").Trim()
$osrecoveryconf = Get-WmiObject Win32_OSRecoveryConfiguration

if ( $startuptimeout -eq 10 ) {
	Write-host "OK: 06 - pre #System Startup: Timeout before start is set to 10 seconds "
	}
else {
	Write-host "NOK: 06 - pre #System Startup: Timeout before start is not set to 10 seconds "
	}

if ( $osrecoveryconf.AutoReboot -eq [bool]1) {
	Write-host "OK: 06 - pre #System Recovery: Auto restart is enabled"
	}
else {
	Write-host "NOK: 06 - pre #System Recovery: Auto restart is not enabled"
	}
	
if ( $osrecoveryconf.DebugInfoType -eq [uint32]3) {
	Write-host "OK: 06 - pre #System Recovery: Debug is set to small memory dump"
	}
else {
	Write-host "NOK: 06 - pre #System Recovery: Debug is not set to small memory dump"
	}
		






