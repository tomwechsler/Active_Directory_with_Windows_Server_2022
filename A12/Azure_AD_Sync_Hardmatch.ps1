#Create a variable for the user
$user = "sina.meier"

#Create the UPN variable
$userUPN = "sina.meier@tomsazure.ch"

#We need the guid
$guid = [guid]((Get-ADUser -Identity "$user").objectGuid)

#Convert to Base64
$immutableId = [System.Convert]::ToBase64String($guid.ToByteArray())

#Connect to the Microsoft 365
Connect-MsolService

#Set the ImmutableId
Get-MsolUser -UserPrincipalName $userUPN | Set-MsolUser -ImmutableId $immutableId