# Collect baseline test values prior to Jenkins run.
# Current System SID.

$sid = (Get-WmiObject Win32_UserAccount | Where-Object { $_.Name -like "Administrator" } | Select SID)
$sid_check = $sid.SID


if ( $sid_check -match "-500$" ) {
	write-host "OK: 02 - pre #SID:" $sid_check.TrimEnd('-500')
} else {
	Write-host "NOK: 02 - pre #SID: Unable to obtain a valid SID"
}
