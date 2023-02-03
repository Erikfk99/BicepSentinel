param workspaceName string

resource LogAnalyticsWorkspace 'Microsoft.OperationalInsights/workspaces@2020-10-01' existing = {
  name: workspaceName

}


resource templateAlert 'Microsoft.SecurityInsights/alertRuleTemplates@2022-12-01-preview' existing = {
  name: '968358d6-6af8-49bb-aaa4-187b3067fb95'
  scope: LogAnalyticsWorkspace
}

resource randomAlert 'Microsoft.SecurityInsights/alertRules@2022-12-01-preview' = {
  name: templateAlert.name
  scope: LogAnalyticsWorkspace
  kind: 'Scheduled'
  properties: {
    alertDetailsOverride: {
      alertDescriptionFormat: templateAlert.properties.alertDetailsOverride.alertDescriptionFormat
      alertDisplayNameFormat: templateAlert.properties.alertDetailsOverride.alertDisplayNameFormat
      alertDynamicProperties: [
        {
          alertProperty: templateAlert.properties.alertDetailsOverride.alertDynamicProperties[0].alertProperty
          value: templateAlert.properties.alertDetailsOverride.alertDynamicProperties[0].value
        }
      ]
      alertSeverityColumnName: templateAlert.properties.alertDetailsOverride.alertSeverityColumnName
      alertTacticsColumnName: templateAlert.properties.alertDetailsOverride.alertTacticsColumnName
    }
    alertRuleTemplateName: templateAlert.name
    customDetails: {}
    description: templateAlert.properties.description
    displayName: templateAlert.properties.displayName
    enabled: templateAlert.properties.enabled
    entityMappings: [
      {
        entityType: templateAlert.properties.entityMappings[0].entityType
        fieldMappings: [
          {
            columnName: templateAlert.properties.entityMappings[0].fieldMappings[0].columnName
            identifier: templateAlert.properties.entityMappings[0].fieldMappings[0].identifier
          }
        ]
      }
    ]
    eventGroupingSettings: {
      aggregationKind: templateAlert.properties.eventGroupingSettings.aggregationKind
    }
    incidentConfiguration: {
      createIncident: templateAlert.properties.incidentConfiguration.createIncident
      groupingConfiguration: {
        enabled: templateAlert.properties.incidentConfiguration.groupingConfiguration.enabled
        groupByAlertDetails: [
          templateAlert.properties.incidentConfiguration.groupingConfiguration.groupByAlertDetails[0]
        ]
        groupByCustomDetails: [
          templateAlert.properties.incidentConfiguration.groupingConfiguration.groupByCustomDetails[0]
        ]
        groupByEntities: [
          templateAlert.properties.incidentConfiguration.groupingConfiguration.groupByEntities[0]
        ]
        lookbackDuration: templateAlert.properties.incidentConfiguration.groupingConfiguration.lookbackDuration
        matchingMethod: templateAlert.properties.incidentConfiguration.groupingConfiguration.matchingMethod
        reopenClosedIncident: templateAlert.properties.incidentConfiguration.groupingConfiguration.reopenClosedIncident
      }
    }
    query: templateAlert.properties.query
    queryFrequency: templateAlert.properties.queryFrequency
    queryPeriod: templateAlert.properties.queryPeriod
    sentinelEntitiesMappings: [
      {
        columnName: templateAlert.properties.sentinelEntitiesMappings[0].columnName
      }
    ]
    severity: templateAlert.properties.severity
    suppressionDuration: templateAlert.properties.suppressionDuration
    suppressionEnabled: templateAlert.properties.suppressionEnabled
    tactics: [
      templateAlert.properties.tactics[0]
    ]
    techniques: [
      templateAlert.properties.techniques[0]
    ]
    templateVersion: templateAlert.properties.templateVersion
    triggerOperator: templateAlert.properties.triggerOperator
    triggerThreshold: templateAlert.properties.triggerThreshold
  }
}
