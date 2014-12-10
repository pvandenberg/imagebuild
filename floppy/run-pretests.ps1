(gci A:\[0123]*|Sort-Object Name) |%{powershell -command $_.Fullname}
