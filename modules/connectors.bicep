param workspaceName string 



module demo2 './connectors/AzureActiveDirectory.bicep' = {
  name: 'office365'
  params: {
    workspaceName: workspaceName
  }
}
