param workspaceName string 


resource LogAnalyticsWorkspace 'Microsoft.OperationalInsights/workspaces@2020-10-01' existing = {
  name: workspaceName
}

//Microsoft Threat Protection
//resource symbolicname3 'Microsoft.SecurityInsights/dataConnectors@2022-12-01-preview' = {
//  name: 'MicrosoftThreatProtection'
//  kind: 'MicrosoftThreatProtection'
//  properties: {
//    dataTypes: {
//      alerts: {
//        state: 'enabled'
//      }
//      incidents: {
//        state: 'disabled'
//      }
//    }
//    filteredProviders: {
//      alerts: [
//        'enabled'
//      ]
//    }
//    tenantId: subscription().tenantId
//  }

 // scope: LogAnalyticsWorkspace
  // For remaining properties, see dataConnectors objects
//}
