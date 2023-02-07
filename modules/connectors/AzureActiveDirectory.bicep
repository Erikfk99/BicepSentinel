param workspaceName string 


resource LogAnalyticsWorkspace 'Microsoft.OperationalInsights/workspaces@2020-10-01' existing = {
  name: workspaceName
}

resource symbolicname 'Microsoft.SecurityInsights/dataConnectors@2022-12-01-preview' = {
  name: 'AzureActiveDirectory'
  kind: 'AzureActiveDirectory'
  properties: {
      dataTypes: {
        alerts: { 
          state: 'enabled'
        }
    }
    tenantId: subscription().tenantId
  }
  scope: LogAnalyticsWorkspace
  // For remaining properties, see dataConnectors objects
}
