# Helper Scripts to Stagger Start webapps:

StaggeredStartWebapps is a Powershell module that acts as wrapper around az cli to stop all sites and start them one by one.

### Prerequisites:

- [Az CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)

### How to use this module:

```powershell
    git clone https://github.com/vijaysaayi/stagger-start-azure-webapps
    cd stagger-start-azure-webapps

    Import-Module .\StaggeredStartWebApps\staggered-start-webapps.psd1 
    StopAllAndStaggeredStartWebapp -SubscriptionId "<subscription-id>" -ResourceGroup "resource-group-name" -AppServicePlan "app-service-plan-name"
```
