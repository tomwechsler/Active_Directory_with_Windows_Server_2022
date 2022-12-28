#Importing the .csv file
$ADUsers = Import-Csv "C:\A05\users.csv" -Delimiter ";"

#UPN-Suffix
$UPN = "prime.pri"

foreach ($User in $ADUsers) {

    #Here is a listing
    $username = $User.username
    $password = $User.password
    $firstname = $User.firstname
    $lastname = $User.lastname
    $initials = $User.initials
    $email = $User.email
    $streetaddress = $User.streetaddress
    $city = $User.city
    $zipcode = $User.zipcode
    $state = $User.state
    $telephone = $User.telephone
    $jobtitle = $User.jobtitle
    $company = $User.company
    $department = $User.department

    #Warning, if user already exists!
    if (Get-ADUser -Filter { SamAccountName -eq $username }) {
        Write-Warning "A user account with username $username already exists in Active Directory."
    }
    else {

        #If user does not exist yet:
        New-ADUser `
            -SamAccountName $username `
            -UserPrincipalName "$username@$UPN" `
            -Name "$firstname $lastname" `
            -GivenName $firstname `
            -Surname $lastname `
            -Initials $initials `
            -Enabled $True `
            -DisplayName "$lastname, $firstname" `
            -City $city `
            -PostalCode $zipcode `
            -Company $company `
            -State $state `
            -StreetAddress $streetaddress `
            -OfficePhone $telephone `
            -EmailAddress $email `
            -Title $jobtitle `
            -Department $department `
            -AccountPassword (ConvertTo-secureString $password -AsPlainText -Force) -ChangePasswordAtLogon $True

        #Output:
        Write-Host "The user account $username is created." -ForegroundColor Cyan
    }
}