# Collect baseline test values prior to Jenkins run.
# Current Powershell execution policy
$policy_check = Get-ExecutionPolicy

if ( $policy_check -eq "RemoteSigned" ) {
	Write-host "OK: 17 - pre #Execution Policy: Set to $policy_check"
	}
else {
	Write-host "NOK: 17 - pre #Execution Policy: Set to $policy_check"
	}








