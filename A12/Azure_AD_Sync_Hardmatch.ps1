$user = "sina.meier"

$userUPN = "sina.meier@tomsazure.ch"

$guid = [guid]((Get-ADUser -Identity "$user").objectGuid)

$immutableId = [System.Convert]::ToBase64String($guid.ToByteArray())

Connect-MsolService

Get-MsolUser -UserPrincipalName $userUPN | Set-MsolUser -ImmutableId $immutableId