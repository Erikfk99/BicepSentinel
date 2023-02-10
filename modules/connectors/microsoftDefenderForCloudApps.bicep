param workspaceName string 


resource LogAnalyticsWorkspace 'Microsoft.OperationalInsights/workspaces@2020-10-01' existing = {
  name: workspaceName
}

//Legger til Microsoft Defender for Cloud Apps data connector
resource symbolicname2 'Microsoft.SecurityInsights/dataConnectors@2022-12-01-preview' = {
  name: 'MicrosoftCloudAppSecurity'
  kind: 'MicrosoftCloudAppSecurity'
  properties: {
      dataTypes: {
        alerts: { 
          state: 'enabled'
        }
        
        discoveryLogs: { 
          state: 'enabled'
        }
    }
    tenantId: subscription().tenantId
  }
  scope: LogAnalyticsWorkspace
  // For remaining properties, see dataConnectors objects
}

