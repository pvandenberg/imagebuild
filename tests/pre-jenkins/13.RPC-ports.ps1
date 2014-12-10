# Collect baseline test values prior to Jenkins run.
# Current RPC Port Setting

$reg_check = Get-ItemProperty -Path HKLM:\Software\Microsoft\Rpc\Internet 

if ( $reg_check.Ports -eq "5001-6000" ) {
	Write-host "OK: 13 - pre #RPC Settings: Port range set to" $reg_check.Ports
} else {
	Write-Host "NOK: 13 - pre #RPC Settings: Port range not correct"
}

if ( $reg_check.PortsInternetAvailable -eq "Y" ) {
	Write-host "OK: 13 - pre #RPC Settings: Port range is available"
} else {
	Write-host "NOK: 13 - pre #RPC Settings: Port range not available"
}

if ( $reg_check.UseInternetPorts -eq "Y" ) {
	Write-host "OK: 13 - pre #RPC Settings: Port range is used"
} else {
	Write-host "NOK: 13 - pre #RPC Settings: Port range NOT used"
}





