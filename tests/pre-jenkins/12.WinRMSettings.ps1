# Collect baseline test values prior to Jenkins run.
# Current WinRM settings.

[xml]$settings = (winrm get winrm/config -format:pretty)

if ( $settings.Config.MaxTimeoutms -eq 1800000 ) {
	Write-host "OK: 12 - pre #WinRM settings: MaxTimeout has been set to 1800000 ms"
	}
else {
	Write-Host "NOK: 12 - pre #WinRM settings: MaxTimeout has not been set to 1800000 ms"
	}	

if ( $settings.Config.Client.Auth.Basic -eq "true" ) {
	Write-host "OK: 12 - pre #WinRM settings: Client Basic Auth set to true"
	}
else {
	Write-Host "NOK: 12 - pre #WinRM settings: Client Basic Auth not set to true"
	}

if ( $settings.Config.Client.Defaultports.HTTP -eq 5985 ) {
	Write-host "OK: 12 - pre #WinRM settings: Client default HTTP port set to 5985"
	}
else {
	Write-Host "NOK: 12 - pre #WinRM settings: Client default HTTP port not set to 5985"
	}

if ( $settings.Config.Service.Auth.Basic -eq "true" ) {
	Write-host "OK: 12 - pre #WinRM settings: Service Basic Auth set to true"
	}
else {
	Write-Host "NOK: 12 - pre #WinRM settings: Service Basic Auth not set to true"
	}

if ( $settings.Config.Service.Defaultports.HTTP -eq 5985 ) {
	Write-host "OK: 12 - pre #WinRM settings: Service default HTTP port set to 5985"
	}
else {
	Write-Host "NOK: 12 - pre #WinRM settings: Service default HTTP port not set to 5985"
	}

if ( $settings.Config.Winrs.MaxMemoryPerShellMB -eq 512 ) {
	Write-host "OK: 12 - pre #WinRM settings: MaxMemory Winrs has been set to 512MB"
	}
else {
	Write-Host "NOK: 12 - pre #WinRM settings: MaxMemory Winrs has not been set to 512MB"
	}
