#Create new group
New-ADGroup -Name "Marketing" -GroupScope DomainLocal
New-ADGroup -Name "Logistics" -GroupScope Global

#By default, a security group is created "GroupCategory: Security".
Get-ADGroup "Marketing"

#Create a new group with more information
New-ADGroup -Name 'Tech' `
-Description 'Security group for all tech users' `
-DisplayName 'Tech' `
-GroupCategory Security `
-GroupScope Global `
-SAMAccountName 'Tech' `
-PassThru

#Add user to group
Add-ADGroupMember -Identity 'Tech' -Members "Boris.Jones", "Leonard.Clark" -PassThru

#Did it work? (As far as OK, but I had to "search" the account specifically).
Get-ADGroupMember -Identity 'Tech' 

#This works even better
New-ADGroup -Name 'Manager' `
-Description 'Security group for all managers' `
-DisplayName 'Manager' `
-GroupCategory Security `
-GroupScope Global `
-SAMAccountName 'Manager' `
-PassThru

#Create a variable
$ManagerArray = (Get-ADUser -Filter {Title -like "*Manager*" } `
-Properties Title).SAMAccountName

#Is the variable OK?
$ManagerArray

#Now we add the content of the variable to the group
Add-ADGroupMember -Identity "Manager" -Members $ManagerArray -PassThru

#Did it work?
Get-ADGroupMember -Identity Manager `
| Get-ADUser -Properties Title `
| Format-Table -AutoSize SAMAccountName,Name,Title