param workspaceName string




module demoRule './workbooks/woorkbooks.bicep' = {
  name: 'analytics_demoRule'
  params: {
    workspace: workspaceName
  }
}
