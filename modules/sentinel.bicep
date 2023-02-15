param location string

var workspaceName = 'Sentinel-BICEP'
resource LogAnalyticsWorkspace 'Microsoft.OperationalInsights/workspaces@2020-10-01' = {
  name: workspaceName
  location: location
  properties: {
    sku: {
      name: 'PerGB2018'
    }
    retentionInDays:60
  }
}

resource LogAnalyticsSolution 'Microsoft.OperationsManagement/solutions@2015-11-01-preview' = {
  name: 'SecurityInsights(${LogAnalyticsWorkspace.name})'
  location: location
  properties: {
    workspaceResourceId: LogAnalyticsWorkspace.id
  }


  plan: {
    publisher: 'Microsoft'
    product: 'OMSGallery/SecurityInsights'
    name: 'SecurityInsights(${LogAnalyticsWorkspace.name})'
    promotionCode: ''
  }
}

output WorkspaceName string = LogAnalyticsWorkspace.name

