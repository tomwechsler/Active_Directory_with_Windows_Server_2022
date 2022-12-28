#We need to change the scope
Set-ADGroup "Marketing" -GroupScope Universal

#Control
Get-ADGroup "Marketing"

#Then surely we can change from Global to Domainlocal?
Get-ADGroup "Logistics"
Set-ADGroup "Logistics" -GroupScope DomainLocal

#This can be done only by an intermediate step
Set-ADGroup "Logistics" -GroupScope Universal
Set-ADGroup "Logistics" -GroupScope Domainlocal

#Did it work?
Get-ADGroup "Logistics"

#We need a new security group, no problem!
New-ADGroup -Name "IT" -GroupScope Global

#We need to add the accounts from IT to this group, which users are in IT?
Get-ADUser -Filter {department -eq "IT"} -Properties department

#Perfect, then I can extend this right away (Error, why? Add-ADGroupMember wants a list with groups not Members)
Get-ADUser -Filter {department -eq "IT"} -Properties department | Add-ADGroupMember "IT" 

#OK, this is how it works
Get-ADUser -Filter {department -eq "IT"} -Properties department | Add-ADPrincipalGroupMembership -MemberOf "IT"

#Did it work?
Get-ADGroupMember "IT" | Get-ADUser -Properties department

#Which groups is Jonathan Fisher in?
Get-ADPrincipalGroupMembership "Jonathan.Fisher"