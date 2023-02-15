param workspaceName string 


resource LogAnalyticsWorkspace 'Microsoft.OperationalInsights/workspaces@2020-10-01' existing = {
  name: workspaceName
}


resource EntityAnalytics 'Microsoft.SecurityInsights/settings@2022-12-01-preview'={
  name: 'EntityAnalytics'
  kind: 'EntityAnalytics'
  properties: {
    entityProviders: [
      'AzureActiveDirectory'
    ]
  }
  scope:LogAnalyticsWorkspace

  
}

