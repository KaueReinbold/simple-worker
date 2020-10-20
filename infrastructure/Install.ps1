# Params
param (
    [Parameter(Mandatory=$true)]
    [string]$Path,
    [Parameter(Mandatory=$true)]
    [String]$ExeFileName,
    [Parameter(Mandatory=$true)]
    [string]$UserName,
    [Parameter(Mandatory=$true)]
    [SecureString]$Password,
    [Parameter(Mandatory=$true)]
    [String]$Name,
    [Parameter(Mandatory=$false)]
    [String]$DisplayName = "",
    [Parameter(Mandatory=$false)]
    [String]$Description = ""
)

# Imports
. .\Stop-Service.ps1
. .\Remove-Service.ps1
. .\New-Service.ps1
. .\Start-Service.ps1


StopService($Name)

RemoveService($Name)

NewService($Path, $ExeFileName, $UserName, $Password, $Name, $DisplayName, $Description)

StartService($Name)

Write-Host "Done"