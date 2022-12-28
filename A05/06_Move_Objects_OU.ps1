#The AD has no command for OUs to move content
Get-Command *org*

#We need to help ourselves with the cmdlet get-adobject. What does the help give us?
Get-Help Get-ADObject -Examples

#Let's search for accounts
Get-ADObject -SearchBase "DC=prime,DC=pri" -Filter *

#By department
Get-ADUser -Filter "department -eq 'IT'"

#By department and city
Get-ADUser -Filter "department -eq 'IT' -and city -eq 'Luzern'"

#Listed a little bit better
Get-ADUser -Filter "department -eq 'IT' -and city -eq 'Luzern'" -Properties department, city | Select-Object name, city, department

#Now we move these three accounts
Get-ADUser -Filter "department -eq 'IT' -and city -eq 'Luzern'" -Properties department, city | Move-ADObject -TargetPath "OU=Engineers,OU=Luzern,DC=prime,DC=pri"

#Did it work?
#So we do not get a list
Get-ADObject -SearchBase "OU=Engineers,OU=Luzern,DC=prime,DC=pri" -Filter *

#So is better
$OUpath = "OU=Engineers,OU=Luzern,DC=prime,DC=pri"
Get-ADUser -Filter * -SearchBase $OUpath | Select-object Name, UserPrincipalName