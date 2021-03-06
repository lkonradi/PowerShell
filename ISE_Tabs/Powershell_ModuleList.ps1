
#List all modules

Get-Module -ListAvailable

##Output from working machine 
    Directory: C:\Windows\system32\WindowsPowerShell\v1.0\Modules


ModuleType Version    Name                                ExportedCommands                                                                                    
---------- -------    ----                                ----------------                                                                                    
Manifest   1.0.0.0    ActiveDirectory                     {Get-ADRootDSE, New-ADObject, Rename-ADObject, Move-ADObject...}                                    
Manifest   1.0.0.0    AppLocker                           {Set-AppLockerPolicy, Get-AppLockerPolicy, Test-AppLockerPolicy, Get-AppLockerFileInformation...}   
Manifest   1.0.0.0    BitsTransfer                        {Add-BitsFile, Remove-BitsTransfer, Complete-BitsTransfer, Get-BitsTransfer...}                     
Manifest   1.0.0.0    CimCmdlets                          {Get-CimAssociatedInstance, Get-CimClass, Get-CimInstance, Get-CimSession...}                       
Manifest   1.0.0.0    GroupPolicy                         {Backup-GPO, Copy-GPO, Get-GPInheritance, Get-GPO...}                                               
Script     1.0.0.0    ISE                                 {New-IseSnippet, Import-IseSnippet, Get-IseSnippet}                                                 
Manifest   3.0.0.0    Microsoft.PowerShell.Diagnostics    {Get-WinEvent, Get-Counter, Import-Counter, Export-Counter...}                                      
Manifest   3.0.0.0    Microsoft.PowerShell.Host           {Start-Transcript, Stop-Transcript}                                                                 
Manifest   3.1.0.0    Microsoft.PowerShell.Management     {Add-Content, Clear-Content, Clear-ItemProperty, Join-Path...}                                      
Manifest   3.0.0.0    Microsoft.PowerShell.Security       {Get-Acl, Set-Acl, Get-PfxCertificate, Get-Credential...}                                           
Manifest   3.1.0.0    Microsoft.PowerShell.Utility        {Format-List, Format-Custom, Format-Table, Format-Wide...}                                          
Manifest   3.0.0.0    Microsoft.WSMan.Management          {Disable-WSManCredSSP, Enable-WSManCredSSP, Get-WSManCredSSP, Set-WSManQuickConfig...}              
Manifest   1.0        MSOnline                            {New-MsolServicePrincipalAddresses, New-MsolLicenseOptions, Connect-MsolService, New-MsolAdminist...
Manifest   1.0        MSOnlineExtended                    {New-MsolServicePrincipalAddresses, New-MsolLicenseOptions, Connect-MsolService, New-MsolAdminist...
Binary     1.0        PSDesiredStateConfiguration         {Set-DscLocalConfigurationManager, Start-DscConfiguration, Configuration, Get-DscConfiguration...}  
Script     1.0.0.0    PSDiagnostics                       {Disable-PSTrace, Disable-PSWSManCombinedTrace, Disable-WSManTrace, Enable-PSTrace...}              
Binary     1.1.0.0    PSScheduledJob                      {New-JobTrigger, Add-JobTrigger, Remove-JobTrigger, Get-JobTrigger...}                              
Manifest   2.0.0.0    PSWorkflow                          {New-PSWorkflowExecutionOption, New-PSWorkflowSession, nwsn}                                        
Manifest   1.0.0.0    PSWorkflowUtility                   Invoke-AsWorkflow                                                                                   
Manifest   1.0.0.0    TroubleshootingPack                 {Get-TroubleshootingPack, Invoke-TroubleshootingPack}                                               


    Directory: C:\Program Files (x86)\Microsoft SQL Server\110\Tools\PowerShell\Modules


ModuleType Version    Name                                ExportedCommands                                                                                    
---------- -------    ----                                ----------------                                                                                    
Manifest   1.0        SQLASCMDLETS                        {Add-RoleMember, Backup-ASDatabase, Invoke-ASCmd, Invoke-ProcessCube...}                            
Manifest   1.0        SQLPS                               {Backup-SqlDatabase, Add-SqlAvailabilityDatabase, Disable-SqlAlwaysOn, Enable-SqlAlwaysOn...}       
