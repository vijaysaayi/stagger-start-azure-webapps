function Set-DefaultSubscription(){
    [CmdletBinding()]
    param (  
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$SubscriptionId
    ) 
    
    Write-Host "Setting default subscription as $SubscriptionId"
    az account set -s $SubscriptionId
}