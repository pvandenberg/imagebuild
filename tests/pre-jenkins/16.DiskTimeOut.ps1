# Collect baseline test values prior to Jenkins run.
# Current Disk TimeOut Setting

$reg = Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\services\Disk"
$reg_check = $reg.TimeOutValue

if ( $reg_check -eq 190 ) {
	Write-host "OK: 16 - pre #Disk TimeOut: Set to $reg_check"
	}
else {
	Write-host "NOK: 16 - pre #Disk TimeOut: Set to $policy_check in stead of 190"
	}
	
	






