param workspaceName string 



module demo2 './connectors/Office365.bicep' = {
  name: 'office365'
  params: {
    workspaceName: workspaceName
  }
}


module demo3 './connectors/AzureActiveDirectory.bicep' = {
  name: 'AzureActiveDirectory'
  params: {
    workspaceName: workspaceName
  }
}


module demo4 './connectors/microsoftDefenderForCloudApps.bicep' = {
  name: 'microsoftDefenderForCloudApps'
  params: {
    workspaceName: workspaceName
  }
}
