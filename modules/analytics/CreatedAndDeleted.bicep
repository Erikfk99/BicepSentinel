param workspaceName string



resource LogAnalyticsWorkspace 'Microsoft.OperationalInsights/workspaces@2020-10-01' existing = {
  name: workspaceName

}


resource templateAlert 'Microsoft.SecurityInsights/alertRuleTemplates@2022-12-01-preview' existing = {
  name: 'bb616d82-108f-47d3-9dec-9652ea0d3bf6'
  scope: LogAnalyticsWorkspace
}


// Account Created and Deleted in Short Timeframe
resource randomAlert 'Microsoft.SecurityInsights/alertRules@2022-12-01-preview' = {
  name: templateAlert.name
  scope: LogAnalyticsWorkspace
  kind: 'Scheduled'
  properties: {
    displayName: templateAlert.properties.displayName
    description: templateAlert.properties.description
    severity: templateAlert.properties.severity
    enabled: true
    query: templateAlert.properties.query
    queryFrequency: templateAlert.properties.queryFrequency
    queryPeriod: templateAlert.properties.queryPeriod
    triggerOperator: templateAlert.properties.triggerOperator
    triggerThreshold: templateAlert.properties.triggerThreshold
    suppressionDuration: 'PT5H'
    suppressionEnabled: false
    tactics: templateAlert.properties.tactics
    techniques: templateAlert.properties.techniques
    alertRuleTemplateName: templateAlert.name
    incidentConfiguration: {
      createIncident: true
      groupingConfiguration: {
        enabled: false
        reopenClosedIncident: false
        lookbackDuration: 'PT5H'
        matchingMethod: 'AllEntities'
        groupByEntities: []
        groupByAlertDetails: []
        groupByCustomDetails: []
      }
    }
    eventGroupingSettings: {
      aggregationKind: 'SingleAlert'
    }
    alertDetailsOverride: null
    customDetails: null
    entityMappings: templateAlert.properties.entityMappings
    sentinelEntitiesMappings: null
    templateVersion: templateAlert.properties.version
  }
}
