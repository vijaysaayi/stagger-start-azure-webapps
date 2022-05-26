function Start-Webapp(){
    [CmdletBinding()]
    param (  
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$ResourceGroup,

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$WebappName
    ) 
    
    Write-Host "Starting Webapp $WebappName"
    az webapp start --name $WebappName --resource-group $ResourceGroup
}