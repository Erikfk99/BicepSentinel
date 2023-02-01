targetScope = 'subscription'
param location string
param resourceGroupName string

//Deploy the resource group
resource rg 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: resourceGroupName
  location: location
}

//Deploy log anaytics workspace
// and Sentinel solution
module Sentinel './modules/sentinel.bicep' = {
  name: 'module_sentinel'
  scope: rg
  params: {
    location: rg.location
  }
}

//Deploy analytic rules(Alerts)
module AnalyticRules './modules/analytics.bicep' = {
  name: 'module_analytics'
  scope: rg
  params: {
    workspaceName: Sentinel.outputs.WorkspaceName
    // roleAssignmentId: Sentinel.outputs.roleAssignmentId
  }
  
}
