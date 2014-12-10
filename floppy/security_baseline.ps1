Start-Process 'auditpol.exe' -ArgumentList '/set /category:"Account Logon" /success:enable /failure:enable' -Wait -NoNewWindow
Start-Process 'auditpol.exe' -ArgumentList '/set /category:"Account Management" /success:enable /failure:enable' -Wait -NoNewWindow
Start-Process 'auditpol.exe' -ArgumentList '/set /category:"Detailed Tracking" /success:disable /failure:disable' -Wait -NoNewWindow
Start-Process 'auditpol.exe' -ArgumentList '/set /category:"Ds Access" /success:disable /failure:disable' -Wait -NoNewWindow
Start-Process 'auditpol.exe' -ArgumentList '/set /category:"Logon/Logoff" /success:enable /failure:enable' -Wait -NoNewWindow
Start-Process 'auditpol.exe' -ArgumentList '/set /category:"Object Access" /success:disable /failure:disable' -Wait -NoNewWindow
Start-Process 'auditpol.exe' -ArgumentList '/set /category:"Policy Change" /success:enable /failure:enable' -Wait -NoNewWindow
Start-Process 'auditpol.exe' -ArgumentList '/set /category:"Privilege Use" /success:disable /failure:enable' -Wait -NoNewWindow
Start-Process 'auditpol.exe' -ArgumentList '/set /category:"System" /success:disable /failure:disable' -Wait -NoNewWindow