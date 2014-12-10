# Collect baseline test values prior to Jenkins run.
# Current Disksize

$disk = (Get-Disk).size/1024/1024/1024

if ( $disk -eq 60 ) {
	Write-host "OK: 15 - pre #Disk current disk size is 60 GB"
	}
else {
	Write-host "NOK: 15 - pre #Disk current disk size is not 60 GB"
	}
