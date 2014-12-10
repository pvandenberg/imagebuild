# Collect baseline test values prior to Jenkins run.
# Current TimeZone Setting

$TimeZone = Get-WmiObject Win32_TimeZone
$TimeZone_check = $TimeZone.Caption

If ($TimeZone_check -match 'Amsterdam') {
	Write-Host "OK: 05 - pre #TimeZone is set to Amsterdam."
	}
Else {
	Write-Host "NOK: 05 - pre #TimeZone has changed to" $TimeZone_check
}




