# Speech Synthesizer

<#
.Synopsis
   Short description
.DESCRIPTION
   Long description
.EXAMPLE
   Example of how to use this cmdlet
.EXAMPLE
   Another example of how to use this cmdlet
#>
function new-speech {
   
    Param
    (
        [Parameter(Mandatory = $true, 
            ValueFromPipeline = $true)]
        [string]$text
    )

    #set up .net object for use
    Add-Type -AssemblyName System.Speech 
    $synth = New-Object -TypeName System.Speech.Synthesis.SpeechSynthesizer
    
    #Write-Host $text
    $synth.speak($text)
 
}

#new-speech -text "This is a test"

function Show-Menu 
{
   [CmdletBinding()]
    param (
        [string]$Title = "My Menu"
    
    )
    clear-host
    #Write-Host "'n'n'n" # adds three blank lines
    Write-Host "                                                                     "
    Write-Host "====================================================================="
    Write-Host "     Spelling Words Menu        "
    Write-Host "====================================================================="
    Write-Host "                                  "
    Write-Host "1. Easy Peasy Lemon Squeezy     "
    Write-Host "                                  "
    Write-Host "2. White Belt "
    Write-Host "                                  "
    Write-Host "3. Bring it on "
    Write-Host "                                  "
    Write-Host "4. Brown Belt "
    Write-Host "                                  "
    Write-Host "5. I Love a Challenge! "
    Write-Host "                                  "
    Write-Host "6. Black Belt "
    Write-Host "                                  "
    Write-Host "X. Exit this menu                 "
    Write-Host "                                  "
}
