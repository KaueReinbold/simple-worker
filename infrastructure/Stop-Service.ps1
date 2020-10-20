# Imports
. .\Get-ServiceIfExists.ps1

function StartService {
    param (
        [Parameter(Mandatory=$true)]
        [string]$ServiceName
    )

    $Service = Get-ServiceIfExists($ServiceName);
     
    If ($null -ne $Service) {
        Stop-Service -Name $ServiceName
    } else {
        Write-Host "$ServiceName does not exists"
    }
}