# Collect baseline test values prior to Jenkins run.
# Current IE Security Setting

$reg = (Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}')
$reg_check = $reg.IsInstalled

if ( $reg_check -eq 0 ) {
	Write-host "OK: 09 - pre #IESec Settings: Advanced Security for Administrators is disabled"
} else {
	Write-Host "NOK: 09 - pre #IESec Settings: Advanced Security for Administrators is no disabled"
}






