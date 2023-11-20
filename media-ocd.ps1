<#
.SYNOPSIS
Scans media folders to assess consistency.
#>

[CmdletBinding()]
param()

$initialInformationPreference = $InformationPreference
$InformationPreference = "Continue"

try {
    # script variables
    $path = Get-Location
    $scriptPath = $MyInvocation.MyCommand.Source
    $scriptName = $MyInvocation.MyCommand.Name

    # Initialization
    Write-Verbose "Initializing script..."
    Write-Debug "path: $path"
    Write-Debug "scriptPath: $scriptPath"
    Write-Debug "scriptName: $scriptName"

    Write-Information "$scriptName complete."

}
finally {
    $InformationPreference = $initialInformationPreference
}

