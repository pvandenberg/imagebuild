# Collect baseline test values prior to Jenkins run.
# Current installed windows features

ipmo servermanager

$feature_check = (get-windowsfeature Telnet-client).Installed

if ( $feature_check -eq "True" ) {
	Write-host "OK: 18 - pre #Telnet client has been installed"
} else {
	Write-host "NOK: 18 - pre #Telnet client has not been installed"
}
