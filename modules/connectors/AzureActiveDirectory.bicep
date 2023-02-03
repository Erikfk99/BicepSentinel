param workspaceName string 


resource LogAnalyticsWorkspace 'Microsoft.OperationalInsights/workspaces@2020-10-01' existing = {
  name: workspaceName
}

resource symbolicname 'Microsoft.SecurityInsights/dataConnectors@2022-12-01-preview' = {
  name: 'Office365'
  kind: 'Office365'
  properties: {
      dataTypes: {
        sharePoint: { 
          state: 'enabled'
        }
        exchange: {
            state: 'enabled'
        }
        teams: {
            state: 'enabled'
        }
    }
    tenantId: subscription().tenantId
  }
  scope: LogAnalyticsWorkspace
  // For remaining properties, see dataConnectors objects
}
