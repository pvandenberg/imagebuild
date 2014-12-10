# Collect baseline test values prior to Jenkins run.
# Current System Regional Setting

$Culture = Get-Culture
$Keyboard = $Culture.keyboardlayoutid
$Name = $Culture.name

If ($Keyboard -eq '1033') {
	Write-Host "OK: 04 - pre #Keyboardlayout is set to," $Keyboard
	}
Else {
	Write-Host "NOK: 04 - pre #Keyboardlayout is set to" $Keyboard
}
If ($Name -eq 'en-US') {
	Write-Host "OK: 04 - pre #Culture is set to en-US," $Culture.NativeName
	}
Else {
	Write-Host "NOK: 04 - pre #Culture is set to" $Name $Culture.NativeName
}
