# Download and install XenTools

$XenDriver_url = "http://artifacts.schubergphilis.com/artifacts/xentools/v6.2/citrixxendriversx64.msi"
(New-Object System.Net.WebClient).DownloadFile($XenDriver_url, "C:\Windows\Temp\citrixxendriversx64.msi")
msiexec -i C:\Windows\Temp\citrixxendriversx64.msi /qn
sleep 3

$XenVSS_url = "http://artifacts.schubergphilis.com/artifacts/xentools/v6.2/citrixvssx64.msi"
(New-Object System.Net.WebClient).DownloadFile($XenVSS_url, "C:\Windows\Temp\citrixvssx64.msi")
msiexec -i C:\Windows\Temp\citrixvssx64.msi /qn
sleep 3

$XenAgent_url = "http://artifacts.schubergphilis.com/artifacts/xentools/v6.2/citrixguestagentx64.msi"
(New-Object System.Net.WebClient).DownloadFile($XenAgent_url, "C:\Windows\Temp\citrixguestagentx64.msi")
msiexec -i C:\Windows\Temp\citrixguestagentx64.msi /qn
sleep 3

$CIM_url = "http://artifacts.schubergphilis.com/artifacts/xentools/CIM/CloudInstanceManager.msi"
(New-Object System.Net.WebClient).DownloadFile($CIM_url, "C:\Windows\Temp\CloudInstanceManager.msi")
# only when moving to cloud tempate is succesfull, messes up the Administrator password.
# msiexec -i C:\Windows\Temp\CloudInstanceManager.msi /qn
