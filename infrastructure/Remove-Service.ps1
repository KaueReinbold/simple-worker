# Imports
. .\Get-ServiceIfExists.ps1

function RemoveService {
    param (
        [Parameter(Mandatory=$true)]
        [string]$ServiceName
    )

    $Service = Get-ServiceIfExists($ServiceName);
     
    If ($null -ne $Service) {
        Remove-Service -Name $ServiceName
    } else {
        Write-Host "$ServiceName does not exists"
    }
}