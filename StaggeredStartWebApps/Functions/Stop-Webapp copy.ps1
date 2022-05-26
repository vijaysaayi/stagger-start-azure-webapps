function Stop-Webapp(){
    [CmdletBinding()]
    param (  
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$ResourceGroup,

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$WebappName
    ) 
    
    Write-Host "Stopping Webapp $WebappName"
    az webapp stop --name $WebappName --resource-group $ResourceGroup
}



