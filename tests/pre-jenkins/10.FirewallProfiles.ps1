# Collect baseline test values prior to Jenkins run.
# Current Firewall Profile Settings for Domain, Private and Public

$domainstate_check = (Get-NetFirewallProfile -Name Domain).Enabled
$privatestate_check = (Get-NetFirewallProfile -Name Private).Enabled
$publicstate_check = (Get-NetFirewallProfile -Name Public).Enabled


if ( ($domainstate_check -eq "False") -and ($privatestate_check -eq "False") -and ($publicstate_check -eq "False") ) {
	Write-host "OK: 10 - pre #Firewall Profiles: All profiles set to Disabled"
	}
elseif ($domainstate_check -ne "False" ) {
	Write-host "NOK: 10 - pre #Firewall Profile: Domain Profile is set to Enabled"
	}
elseif ($privatestate_check -ne "False" ) {
	Write-host "NOK: 10 - pre #Firewall Profile: Private Profile is set to Enabled"
	}	
elseif ($publicstate_check -ne "False" ) {
	Write-host "NOK: 10 - pre #Firewall Profile: Public Profile is set to Enabled"
	}	






