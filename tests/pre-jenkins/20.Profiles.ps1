# Collect baseline test values prior to Jenkins run.
# Current number of profiles on the system.
# During the pre check these profile should exist: 
# C:\Users\Administrator,
# C:\Users\sbp_build,
# C:\Windows\ServiceProfiles\NetworkService,
# C:\Windows\ServiceProfiles\LocalService,
# C:\Windows\system32\config\systemprofile
##

$profiles = Get-WmiObject Win32_UserProfile
$profiles_check = $profiles.count


if ( $profiles_check -eq 5 ) {
	Write-host "OK: 20 - pre #Profiles: currently 5 detected, should be 4 after sysprep"
	}
else {
	Write-host "NOK: 20 - pre #Profiles: currently $profiles_check detected, should have been 5 prior to sysprep"
	}