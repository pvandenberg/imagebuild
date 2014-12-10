# Collect baseline test values prior to Jenkins run.
# Current Error Reporting Setting

$reporting = (Get-WindowsErrorReporting)

if ( $reporting -eq 'Disabled' ) {
	Write-host "OK: 07 - pre #ErrorReporting is disabled"
	}
else {
	Write-host "NOK: 07 - pre #ErrorReporting is enabled"
	}
