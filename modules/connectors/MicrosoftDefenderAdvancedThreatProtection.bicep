//param workspaceName string 


//resource LogAnalyticsWorkspace 'Microsoft.OperationalInsights/workspaces@2020-10-01' existing = {
//  name: workspaceName
//}

//test
//resource symbolicname5 'Microsoft.SecurityInsights/dataConnectors@2022-12-01-preview' = {
//  name: 'MicrosoftDefenderAdvancedThreatProtection'
//  kind: 'MicrosoftDefenderAdvancedThreatProtection'
//  properties: {
//    dataTypes: {
//      alerts: { 
//        state: 'enabled'
//      }
//  }
//  tenantId: subscription().tenantId
//}
//scope: LogAnalyticsWorkspace
// For remaining properties, see dataConnectors objects
//}
