# Collect baseline test values prior to Jenkins run.
# Current RDP Settings and validation the TCP/IP port

$reg = (Get-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server')
$reg_check = $reg.fDenyTSConnections
$socket = New-Object Net.Sockets.TcpClient
$socket.Connect('localhost', 3389)
$socket_check = $socket.Connected
$socket.close()


if ( ($reg_check -eq 0) -and ($socket_check -eq $True) ) {
	Write-host "OK: 11 - pre #RDP is enabled and host is listening on port 3389"
	}
elseif ( $reg_check -eq 0) {
	Write-host "NOK: 11 - pre #RDP is not enabled"
	}
elseif ( $socket_check -eq $false) {
	Write-host "NOK: 11 - pre #Host isn't listening on port 3389"
	}
