# Collect baseline test values prior to Jenkins run.
# Current NetBIOS over TCP/IP Setting

$nic = (Get-WMIObject Win32_NetworkadapterConfiguration | where {$_.IPEnabled -eq 'True'})
$nic_check = $nic.TcpipNetbiosOptions

if ( $nic_check -eq 2 ) {
	Write-host "OK: 14 - pre #NetBIOS over TCP has been disabled"
} else {
	Write-host "NOK: 14 - pre #NetBIOS over TCP has not been disabled"
}




