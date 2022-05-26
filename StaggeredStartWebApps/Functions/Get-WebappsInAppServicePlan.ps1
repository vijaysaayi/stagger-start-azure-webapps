function Get-WebappsInAppServicePlan(){
    [CmdletBinding()]
    param (  
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$ResourceGroup,

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$AppServicePlan
    ) 
    
    Write-Host "Fetching the list of webapp in :"
    Write-Host "---------------------------------"
    Write-Host "Resource Group $ResourceGroup "
    Write-Host "App Service Plan $AppServicePlan"
    Write-Host ""
    
    $webapps = az webapp list -g $ResourceGroup --query "[? contains(appServicePlanId,'$AppServicePlan')].name"  -o json
    foreach ($webapp in $webapps ) 
    {
        Write-Host $webapp
    }

    return $webapps
}



