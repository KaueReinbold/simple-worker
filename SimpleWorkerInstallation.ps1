
$Output = "/services/output/simple-worker"
$UserName = "SimpleWorkerUser"
$Password = ConvertTo-SecureString "ThisIsASecurePassword" -AsPlainText -Force

if (!(Test-Path $Output)) {
    New-Item -Path $Output
}

Remove-Item -Recurse -Force $Output

dotnet publish src/ --configuration Release --output $Output

$ExeFileName = (Get-ChildItem $Output -Recurse -Include "*.exe").Name

.\infrastructure\Create-User.ps1 $UserName $Password

# Invoke-Item "c:\WINDOWS\system32\secpol.msc"

# Write-Host -NoNewLine 'Add user ( ' $UserName ' ) to the Log on as a service policy. Then press any key to continue...';
# $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
