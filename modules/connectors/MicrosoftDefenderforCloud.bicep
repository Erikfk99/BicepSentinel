param workspaceName string 


resource LogAnalyticsWorkspace 'Microsoft.OperationalInsights/workspaces@2020-10-01' existing = {
  name: workspaceName
}

//Microsoft Defenderfor Cloud
resource symbolicname3 'Microsoft.SecurityInsights/dataConnectors@2022-12-01-preview' = {
  name: 'MicrosoftDefenderforCloud'
  kind: 'AzureSecurityCenter'
  properties: {
      dataTypes: {
        alerts: { 
          state: 'enabled'
        }
    }
    subscriptionId: subscription().subscriptionId
  }
  scope: LogAnalyticsWorkspace
  // For remaining properties, see dataConnectors objects
}
