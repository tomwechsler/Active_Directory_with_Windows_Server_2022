#Test a channel between the local computer and its domain
Test-ComputerSecureChannel

#Test a channel between the local computer and a domain controller
Test-ComputerSecureChannel -Server "dc01.prime.pri"

#Reset the channel between the local computer and its domain
Test-ComputerSecureChannel -Repair

#Display detailed information about the test
Test-ComputerSecureChannel -Verbose