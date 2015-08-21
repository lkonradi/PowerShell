﻿## This will remove the "O365_Users" group and
## remove the licenses / delete the user in O365 
## for DISABLED USERS in CAH_MailBox_Backup OU

#Connect Msol
$msolcred = get-credential
connect-msolservice -credential $msolcred
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.outlook.com/powershell/ -Credential $msolcred -Authentication Basic -AllowRedirection
Import-PSSession $Session

#Where to get the users

$offboard = Get-ADUser -filter 'enabled -eq $false' -Properties SamAccountName, UserPrincipalName -SearchBase "OU=CAH_MailBox_Backup,DC=colonyah,DC=local"

foreach ($O in $Offboard)


{
    #Get-ADUser -Filter "SamAccountName -eq '$($o.samaccountname)'" -Properties UserPrincipalName, SamAccountName |

    #Remove-ADPrincipalGroupMembership -MemberOf "O365*" -Confirm:$false

    #Get-MsolUser -UserPrincipalName $o.UserPrincipalName 

    #Set-MsolUserLicense -UserPrincipalName $o.UserPrincipalName -RemoveLicenses Colonyamerican:STANDARDPACK |

    Remove-MsolUser -UserPrincipalName $o.UserPrincipalName -Force

}



$users= get-aduser -filter 'enabled -eq $false' -Properties SamAccountName, UserPrincipalName -SearchBase "OU=CAH_MailBox_Backup,DC=colonyah,DC=local"

Function RemoveMemberships

{

param([string]$SAMAccountName) 

$user = Get-ADUser $SAMAccountName -properties memberof

$userGroups = $user.memberof

$userGroups | %{get-adgroup $_ | Remove-ADGroupMember -confirm:$false -member $SAMAccountName}

$userGroups = $null

}


$users | %{RemoveMemberships $_.SAMAccountName}