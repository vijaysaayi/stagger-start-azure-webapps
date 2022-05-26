function StopAllAndStaggeredStartWebapp(){
    [CmdletBinding()]
    param ( 
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$SubscriptionId,    
    
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$ResourceGroup,

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$AppServicePlan,

        [int]$WaitIntervalBetweenTwoSiteStartsInSeconds=30
    ) 
    
    Write-Host ""
    Set-DefaultSubscription -SubscriptionId $SubscriptionId
    Write-Host ""

    $webapps = Get-WebappsInAppServicePlan -ResourceGroup $ResourceGroup -AppServicePlan $AppServicePlan
    $webapps = $webapps | ConvertFrom-Json

    Write-Host ""
    Write-Host "Stopping all webapps in app service plan - $AppServicePlan :"
    Write-Host "---------------------------------------------------------------"
    foreach ($webapp in $webapps ) {
        Stop-Webapp -ResourceGroup $ResourceGroup -WebappName $webapp
    }

    Write-Host ""
    Write-Host "Starting webapps one by one :"
    Write-Host "---------------------------------"
    foreach ($webapp in $webapps ) {
        Start-Webapp -ResourceGroup $ResourceGroup -WebappName $webapp
        Write-Host "Pausing for $WaitIntervalBetweenTwoSiteStartsInSeconds seconds before starting the next webapp"
        Start-Sleep -Seconds $WaitIntervalBetweenTwoSiteStartsInSeconds
        
        Write-Host ""
    }    
}