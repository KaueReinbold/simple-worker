function Get-ServiceIfExists($ServiceName) {
    try {
        $Service = Get-Service $ServiceName -ErrorAction "SilentlyContinue"
    }
    catch {
        $Service = $null
    }

    return $Service
}