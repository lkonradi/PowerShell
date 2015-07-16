Get-ADUser -filter  'enabled -eq $true'  -properties passwordlastset, passwordneverexpires, LastLogonDate, sAMAccountName, company  | sort-object name | select-object Name, passwordlastset, LastLogonDate, passwordneverexpires, sAMAccountName, company | Export-csv -path c:\PswExpired2.csv