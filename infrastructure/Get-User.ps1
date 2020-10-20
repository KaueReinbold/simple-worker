function Get-User {
    param (
        [Parameter(Mandatory=$true)]
        [string] $UserName
    )

    try {
        $User = Get-LocalUser $LocalUserName -ErrorAction "SilentlyContinue"
    }
    catch {
        $User = $null
    }

    return $User
}