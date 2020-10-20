# Params
param(
    [Parameter(Mandatory=$true)]
    [string]$UserName,
    [Parameter(Mandatory=$true)]
    [SecureString]$Password,
    [Parameter(Mandatory=$false)]
    [String]$Description = ""
)

# Imports
. .\Get-User.ps1


# $LocalUserPassword = ConvertTo-SecureString "jvPklQfQ2g" -AsPlainText -Force
$User = Get-User ($UserName)

If ($null -eq $User) {
    New-LocalUser -Name $UserName -Password $Password -Description $Description
} else {
    Write-Host "User ""$UserName"" is already created!"
}