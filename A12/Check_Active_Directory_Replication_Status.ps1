#For a given domain controller we can find its inbound replication partners
Get-ADReplicationPartnerMetadata -Target "dc01.prime.pri"

#We can list down all the inbound replication partners for given domain
Get-ADReplicationPartnerMetadata -Target "prime.pri" -Scope Domain

#Associated replication failures for a site, forest, domain, domain controller can we find
Get-ADReplicationFailure -Target "dc01.prime.pri"

#Replication failures for domain can find we out
Get-ADReplicationFailure -Target "prime.pri" -Scope Domain

#Replication failures for forest
Get-ADReplicationFailure -Target "prime.pri" -Scope Forest

#Replication failures for site
Get-ADReplicationFailure -Target "Default-First-Site-Name" -Scope Site

#Bring all together
#Active Directory Domain Controller Replication Status
$domaincontroller = Read-Host 'What is your Domain Controller?'

#Define Objects
$report = New-Object PSObject -Property @{
ReplicationPartners = $null
LastReplication = $null
FailureCount = $null
FailureType = $null
FirstFailure = $null
}

#Replication Partners
$report.ReplicationPartners = (Get-ADReplicationPartnerMetadata -Target $domaincontroller).Partner
$report.LastReplication = (Get-ADReplicationPartnerMetadata -Target $domaincontroller).LastReplicationSuccess

#Replication Failures
$report.FailureCount  = (Get-ADReplicationFailure -Target $domaincontroller).FailureCount
$report.FailureType = (Get-ADReplicationFailure -Target $domaincontroller).FailureType
$report.FirstFailure = (Get-ADReplicationFailure -Target $domaincontroller).FirstFailureTime

#Format Output
$report | Select-Object ReplicationPartners,LastReplication,FirstFailure,FailureCount,FailureType | Out-GridView


