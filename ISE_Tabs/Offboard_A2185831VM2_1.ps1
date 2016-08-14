﻿## This will remove the groups and
## remove the licenses / delete the user in O365 / Move to disabled OU 
## for DISABLED USERS in CAH_MailBox_Backup OU
########################################################################

#Connect Msol
$msolcred = get-credential
connect-msolservice -credential $msolcred
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.outlook.com/powershell/ -Credential $msolcred -Authentication Basic -AllowRedirection
Import-PSSession $Session
#Remove AD Group Membership from Offboarded Accounts
$users= get-aduser -filter 'enabled -eq $false' -Properties SamAccountName, UserPrincipalName -SearchBase "OU=CAH_MailBox_Backup,DC=colonyah,DC=local"
Function RemoveMemberships
{
param([string]$SAMAccountName) 
$user = Get-ADUser $SAMAccountName -properties memberof
$userGroups = $user.memberof
$userGroups | %{get-adgroup $_ | Remove-ADGroupMember -confirm:$false -member $SAMAccountName}
$userGroups = $null
} $users | %{RemoveMemberships $_.SAMAccountName}
#Remove from O365
$offboard = Get-ADUser -filter 'enabled -eq $false' -Properties SamAccountName, UserPrincipalName -SearchBase "OU=CAH_MailBox_Backup,DC=colonyah,DC=local"
foreach ($O in $Offboard)
{
#Get-MsolUser -UserPrincipalName $o.UserPrincipalName 
Remove-MsolUser -UserPrincipalName $o.UserPrincipalName -Force
}
#Move to disabled
$Moved = Get-ADUser -filter 'enabled -eq $false' -Properties SamAccountName, UserPrincipalName -SearchBase "OU=CAH_MailBox_Backup,DC=colonyah,DC=local"
foreach ($M in $Moved)
{
Get-ADUser $M | Move-ADObject -TargetPath "OU=CAH_Disabled,DC=colonyah,DC=local"
}

#Count Users

Get-ADUser -filter 'enabled -eq $true'  -Properties * -SearchBase "OU=CAH_MailBox_Backup,DC=colonyah,DC=local" | Measure 

#Get the Users

Get-ADUser -filter 'enabled -eq $true'  -Properties * -SearchBase "OU=CAH_MailBox_Backup,DC=colonyah,DC=local" |Select-object Userprincipalname | Export-csv -path c:\ScriptOutput\OffboardList_$((Get-Date).ToString('MM-dd-yyyy')).csv 

#Hide From GAL
Get-ADUser -filter * -SearchBase "OU=CAH_MailBox_Backup,DC=colonyah,DC=local" | Set-ADObject -replace @{msExchHideFromAddressLists=$true}