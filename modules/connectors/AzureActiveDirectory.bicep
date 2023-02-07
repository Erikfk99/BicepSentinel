param workspaceName string 


resource LogAnalyticsWorkspace 'Microsoft.OperationalInsights/workspaces@2020-10-01' existing = {
  name: workspaceName
}

//This enables Azure Active directory Identity Protection, Microsoft 365 Defender and Microsoft Defender for Cloud
resource symbolicname2 'Microsoft.SecurityInsights/dataConnectors@2022-12-01-preview' = {
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
