param workspaceName string




module demoRule './analytics/demoRule.bicep' = {
  name: 'analytics_demoRule'
  params: {
    workspaceName: workspaceName
  }
}

// Add more analytic rules here
module demoRule2 './analytics/BicepruleErik.bicep' = {
 name: 'analytics_demoRule2'
  params: {
    workspaceName: workspaceName
 }
}

module randomAlert './analytics/analyticruletestSimen.bicep' = {
  name: 'randomAlert'
  params: {
    workspaceName: workspaceName
  }
}

module CreatedAndDeleted './analytics/CreatedAndDeleted.bicep' = {
  name: 'CreatedAndDeleted'
  params: {
    workspaceName: workspaceName
  }
}
