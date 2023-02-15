param workspaceName string 


resource LogAnalyticsWorkspace 'Microsoft.OperationalInsights/workspaces@2020-10-01' existing = {
  name: workspaceName
}


resource UEBA 'Microsoft.SecurityInsights/settings@2022-12-01-preview'={
  name: 'Ueba'
  kind: 'Ueba'
  
  scope:LogAnalyticsWorkspace
  properties:{
    dataSources:[
      'AuditLogs', 'AzureActivity', 'SecurityEvent', 'SigninLogs']

  }
}
