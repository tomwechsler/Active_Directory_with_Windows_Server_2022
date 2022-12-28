#Get a list of the UPN suffixes
Get-ADForest | Format-List UPNSuffixes

#Let’s add the UPN suffix
Get-ADForest | Set-ADForest -UPNSuffixes @{add="tomrocks.ch"}

#Get a list of the UPN suffixes
Get-ADForest | Format-List UPNSuffixes

#List of all the AD Users in the organization
Get-ADUser -Filter * | Sort-Object Name | Format-Table Name, UserPrincipalName

#Change the UPN for all the AD users in the organization
$LocalUsers = Get-ADUser -Filter {UserPrincipalName -like '*corp.pri'} -Properties UserPrincipalName -ResultSetSize $null
$LocalUsers | ForEach-Object {$newUpn = $_.UserPrincipalName.Replace("corp.pri","tomrocks.ch"); $_ | Set-ADUser -UserPrincipalName $newUpn}

#Confirm that the UPN is changed
Get-ADUser -Filter * | Sort-Object Name | Format-Table Name, UserPrincipalName