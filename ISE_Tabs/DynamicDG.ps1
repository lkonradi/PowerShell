﻿#Get Dynamic list Members - Export
$DDG = Get-DynamicDistributionGroup "CSH-ALL"

Foreach ($dg in $DDG)
{
Get-Recipient -RecipientPreviewFilter $DG.RecipientFilter -ResultSize "Unlimited" | Select-Object DisplayName, @{Name=“DDG.Name”;Expression={$dg.Name}} | Export-csv C:\ScriptOutput\CSH-All$((Get-Date).ToString('MM-dd-yyyy')).csv
}

#Get members of single list - Count

$DG = Get-DynamicDistributionGroup "TechnologyDepartment"

Get-Recipient -RecipientPreviewFilter $DG.RecipientFilter | Select-Object DisplayName, @{Name=“DDG.Name”;Expression={$dg.Name}} | Measure

#Get Dynamic List Filter
Get-DynamicDistributionGroup "TechnologyDepartment" | fl recipientfilter

#Set Dunamic List filter- !!! do not forget the "{}" around the filter value !!!

#Template --> Get-DynamicDistributionGroup PropertyManagement-AltamonteSprings | Set-DynamicDistributionGroup -recipientfilter {<PutFilterHere>}

Get-DynamicDistributionGroup "TechnologyDepartment" | Set-DynamicDistributionGroup -recipientfilter {(RecipientTypedetails -eq 'UserMailbox') -and (Department -like 'IT -*') -and (-not(RecipientContainer -like 'OU=CAH_MailBox_Backup,DC=colonyah,DC=local'))}

Get-DynamicDistributionGroup "CSH-ALL" | Set-DynamicDistributionGroup -recipientfilter {(RecipientTypedetails -eq 'UserMailbox') -and (-not(Company -like 'Colony American Finance*'))}

Get-DynamicDistributionGroup "ScottsdaleOffice" | Set-DynamicDistributionGroup -recipientfilter { ((RecipientType -eq 'UserMailbox') -and (Office -like 'Scottsdale')) -and (((-not(Name -like 'SystemMailbox{*')) -and (-not(Title -like 'Call Center Agent'))))}


#Create dynamic distribution list

New-DynamicDistributionGroup -Name "Property Administrators" -RecipientFilter {(RecipientType -eq 'UserMailbox') -and (Title -like 'Property Administrator')}

New-DynamicDistributionGroup -Name "Call Center" -RecipientFilter {(RecipientType -eq 'UserMailbox') -and (Department -like 'Call Center')}



RecipientContainer

@{Name=“EmailAddresses”;Expression={$_.EmailAddresses |Where-Object {$_ -LIKE “SMTP:*”}}}
@{Name=“DDG.Name”;Expression={$dg.Name}}