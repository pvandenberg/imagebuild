# Collect baseline test values prior to Jenkins run.
# Current Power scheme setting
# setting the power scheme during install: powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c

$scheme_check = (Get-WmiObject -Class win32_powerplan -Namespace root\cimv2\power -Filter "isActive='true'").ElementName

if ( $scheme_check -eq "High performance" ) {
	Write-host "OK: 08 - pre #Powerscheme is set to:" $scheme_check
} else {
	Write-host "NOK: 08 - pre #Powerscheme is set to:" $scheme_check
}
