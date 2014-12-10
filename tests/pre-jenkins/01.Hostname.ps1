# Collect baseline test values prior to Jenkins run.
# Current hostname
$name_check = ($env:computername).tolower()
write-host "OK: 01 - pre #hostname: $name_check"
