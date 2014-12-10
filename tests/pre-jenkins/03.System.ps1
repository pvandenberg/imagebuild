# Collect baseline test values prior to Jenkins run.
# Current System Settings

$reg = (Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion')

Write-host "OK: 03 - pre #System ProductName is set to:" $reg.ProductName

if ( $reg.RegisteredOwner -eq 'Schuberg Philis') {
	Write-host "OK: 03 - pre #System Registered Owner is set to Schuberg Philis"
	}
else {
	Write-host "NOK: 03 - pre #System Registered Owner is not set to Schuberg Philis"
	}

if ( $reg.RegisteredOrganization -eq 'Schuberg Philis') {
	Write-host "OK: 03 - pre #System Registered Organization is set to Schuberg Philis"
	}
else {
	Write-host "NOK: 03 - pre #System Registered Organization is not set to Schuberg Philis"
	}

	