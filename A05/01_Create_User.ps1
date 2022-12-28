#Lets update the help files
Update-help * -UICulture en-US -Force

#We are looking for the cmdlet
Get-Command *aduser*

#Create a new user, but how?
Get-Help New-ADUser -Examples

#Create a user
New-ADUser BobS

#Account is created, but the account is inactive (password is missing) and doesn't have much additional info
Get-ADUser -Identity Bobs 

#Delete the account
Remove-ADUser -Identity BobS

#Create the account again
New-ADUser -Name BobS -Department Technik -Title Manager -City Luzern

#Yes, the details are correct, but still inactive
Get-ADUser -Identity Bobs -Properties City, Department, Title

#Delete the account
Remove-ADUser -Identity BobS

#Create the account again (I can't do that, but why?)
New-ADUser -Name BobS -Department Technik -Title Manager -City Luzern -AccountPassword "Pass123!"

#Let's look at it and the help
Get-Help New-ADUser -Parameter accountpassword
Get-Help ConvertTo-SecureString

#Create a variable with the "secure" password
$newPassword = ConvertTo-SecureString -String "Pass123!" -AsPlainText -Force

#Now we create the account again
New-ADUser -Name BobS -Department Technik -Title Manager -City Luzern -AccountPassword $newPassword -Enabled $true

#Let's check
Get-ADUser -Identity Bobs -Properties City, Department, Title