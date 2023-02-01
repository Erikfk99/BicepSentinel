param workspaceName string


param ruleEnabled bool = true
param queryFrequency string = 'PT5M'
param queryPeriod string = 'PT24H'

@allowed([
  'High'
  'Medium'
  'Low'
  'Informational'
])

param severity string = 'High'
param suppressionEnabled bool = false
param suppressionDuration string = 'PT1H'

@allowed([
  'Equal'
  'GreaterThan'
  'LessThan'
  'NotEqual'   
])

param triggerOperator string = 'GreaterThan'
param triggerThreshold int = 0


var ruleDisplayName = 'BICEP TEST ALERT'
var ruleDescription = 'BICEP test alert'
var ruleQuery = 'SecurityAlert | take 10'
var tactics = [
  'InitialAccess'
  'Persistence'  
]

resource LogAnalyticsWorkspace 'Microsoft.OperationalInsights/workspaces@2020-10-01' existing = {
  name: workspaceName
}

resource analytics_demoRule 'Microsoft.SecurityInsights/alertRules@2020-01-01' = {
  kind: 'Scheduled'
  name: guid(subscription().id, resourceGroup().id, workspaceName, ruleDisplayName, ruleQuery)
  scope: LogAnalyticsWorkspace
  properties: {
    description: ruleDescription
    displayName: ruleDisplayName
    enabled: ruleEnabled
    query: ruleQuery
    queryFrequency: queryFrequency
    queryPeriod: queryPeriod
    severity: severity
    suppressionDuration: suppressionDuration
    suppressionEnabled: suppressionEnabled
    tactics: tactics
    triggerOperator: triggerOperator
    triggerThreshold: triggerThreshold
  }
}


