#Create a new OU
New-ADOrganizationalUnit -Name "Engineers"

#Short check
Get-ADOrganizationalUnit -Filter *

#Still two new OU's
New-ADOrganizationalUnit -Name "Luzern"

New-ADOrganizationalUnit -Path "OU=Luzern,DC=prime,DC=pri" -Name "Engineers"

#Now there is a problem where is the OU Engineers?
Get-ADOrganizationalUnit Engineers

#What does the help say?
Get-Help Get-ADOrganizationalUnit
Get-Help Get-ADOrganizationalUnit -Parameter identity

#Identify the OUs
Get-ADOrganizationalUnit -Identity "OU=Engineers,OU=Luzern,DC=prime,DC=pri"
Get-ADOrganizationalUnit -Identity "OU=Engineers,DC=prime,DC=pri"

#Error, correctly I have to specify the path
Remove-ADOrganizationalUnit "Engineers" 

#Access is denied, but I am logged in as admin
Remove-ADOrganizationalUnit "OU=Engineers,DC=prime,DC=pri" 

#With which account am I logged in?
whoami

#Let's take a close look at the OU
Get-ADOrganizationalUnit "OU=Engineers,DC=prime,DC=pri" -Properties *

#We set the value to False
Set-ADOrganizationalUnit -ProtectedFromAccidentalDeletion $false -Identity "OU=Engineers,DC=prime,DC=pri"

#Now we can delete the OU
Remove-ADOrganizationalUnit "OU=Engineers,DC=prime,DC=pri"

#Did it work?
Get-ADOrganizationalUnit -Identity "OU=Engineers,DC=prime,DC=pri"