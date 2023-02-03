param workspaceName string 




module demoConnector './connectors/connector1.bicep' = {
  name: 'symbolicname'
  params: {
    workspaceName: workspaceName
  }
}
