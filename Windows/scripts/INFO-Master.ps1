
#requires -version 3

<#
.SYNOPSIS
	This script part of the Zabbix
    Tempalte Windows OS Active
    Requrired PowerShell 3.0 or higher

.OUTPUTS
  Output in JSON format for Zabbix
.NOTES
  Version:        1.0
  Creation Date:  19/06/2020
  Purpose/Change: Initial script development

.EXAMPLE
  INDO-Master.ps1
#>

##############################################
$SQLDatabase = "X"
$SQLUser = "X"
$SQLPass = "X"
##############################################
$Domain = "select * from [mdaemon].[dbo].[Domains]"
$Mailbox = "select * from [mdaemon].[dbo].[UserList]"
##############################################
$DOMAIN_TOTAL = Invoke-Sqlcmd -ServerInstance "X" -Database $SQLDatabase -Username $SQLUser -Password $SQLPass -Query $Domain
$MAILBOX = Invoke-Sqlcmd -ServerInstance "X" -Database $SQLDatabase -Username $SQLUser -Password $SQLPass -Query $Mailbox
##############################################

@{"DOMAIN_TOTAL" = [int]$DOMAIN_TOTAL.Count
  "MAILBOX" = [int]$MAILBOX.Count} | ConvertTo-Json
