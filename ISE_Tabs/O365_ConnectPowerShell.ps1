﻿Break

#Connect to O365
$LiveCred = Get-Credential
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.outlook.com/powershell/ -Credential $LiveCred -Authentication Basic -AllowRedirection
Import-PSSession $Session
connect-msolservice -credential $LiveCred


#Connect SharePointOnline
Connect-SPOService -Url https://colonyamerican-admin.sharepoint.com -credential Ariel.hart@colonyamerican.com


#Disconnect O365
Remove-PSSession $Session

#Connect Msol
$msolcred = get-credential
connect-msolservice -credential $LiveCred


#Designate DC
$PSDefaultParameterValues = @{"*-AD*:Server"='DC02.colonyah.local'}


