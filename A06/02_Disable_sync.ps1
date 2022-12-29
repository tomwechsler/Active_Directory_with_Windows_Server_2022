#Start a delta sync
Start-ADSyncSyncCycle -PolicyType Delta

#Install the module
Install-Module -Name MSonline -AllowClobber -Verbose -Force

#Connect
Connect-Msolservice

#Disable
Set-MsolDirSyncEnabled -EnableDirSync $false

#Check
(Get-MSOLCompanyInformation).DirectorySynchronizationEnabled