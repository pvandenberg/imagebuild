# Collect baseline test values prior to Jenkins run.
# Current WSUS ClientId

$reg = (Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate')
$reg_check = $reg.SusClientId
Write-host "OK: 21 - pre #SusClientId: $reg_check"
