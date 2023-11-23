<#
.SYNOPSIS
Scans media folders to assess consistency.

.PARAMETER MediaPath
The path to the root of the media repository.

.PARAMETER NonInteractive
If true this script will not prompt the user for input.

.PARAMETER Quiet
If true this script will not output informational text. Verbose or Debug messages will be output if their corresponding preferences are set.

#>

[CmdletBinding()]
param(
    [string]$MediaPath = $env:JSB_MediaPath,
    [switch]$NonInteractive = $false,
    [switch]$Quiet = $false
)


try {
    ##########################################################################
    # Initialization
    ##########################################################################
    Write-Verbose "Initializing script..."
    
    # script variables
    $path = Get-Location
    Write-Debug "path: $path"
    $scriptName = $MyInvocation.MyCommand.Name
    Write-Debug "scriptName: $scriptName"
    $scriptPath = $MyInvocation.MyCommand.Source
    Write-Debug "scriptPath: $scriptPath"
    $scriptRoot = $PSScriptRoot
    Write-Debug "scriptRoot: $scriptRoot"

    # process Quiet parameter
    if (-Not $Quiet) {
        $initialInformationPreference = $InformationPreference
        $InformationPreference = "Continue"
    }

    # process MediaPath parameter
    if (-Not $MediaPath) {
        if ($NonInteractive) {
            Throw "MediaPath parameter is required."
        } else {
            $MediaPath = Read-Host "Enter path to Media, press Enter for [$path]"
            if ($MediaPath -eq "") { $MediaPath = $path }
        }
    }

    # write initialization debug
    Write-Debug "MediaPath: $MediaPath"
    
    ##########################################################################
    # Validate Media Structure
    ##########################################################################


    ##########################################################################
    # Cleanup
    ##########################################################################

    # Remove ehthumbs.db

    Write-Information "$scriptName complete."

}
finally {
    if (-Not $Quiet) {
        # reset information preference
        $InformationPreference = $initialInformationPreference
    }
}

