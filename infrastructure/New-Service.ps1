# Imports
. .\Get-ServiceIfExists.ps1

function NewService {
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
    
    
    # Variables
    $ExePath = "$Path/";
    $ExeFile = "$Path/$ExeFileName";
    $LocalUserName = "$env:computername\$UserName"
    $Service = Get-ServiceIfExists($Name);


    If ($null -eq $Service) {
        $acl = Get-Acl $ExePath
        $aclRuleArgs = $LocalUserName, "Read,Write,ReadAndExecute", "ContainerInherit,ObjectInherit", "None", "Allow"
        $accessRule = New-Object System.Security.AccessControl.FileSystemAccessRule($aclRuleArgs)
        $acl.SetAccessRule($accessRule)
        $acl | Set-Acl $ExePath
        
        $credential = New-Object -TypeName System.Management.Automation.PSCredential($LocalUserName, $Password)
        
        New-Service -Name $Name -BinaryPathName $ExeFile -Credential $credential -Description $Description -DisplayName $DisplayName -StartupType Automatic
    } else {
        Write-Host "Service ""$Name"" is already created!"
    }
}