Invoke-Command -ComputerName dc01,dc02 -ScriptBlock {gpupdate /force}