param workspaceName string 


//Office 365
module demo2 './connectors/Office365.bicep' = {
  name: 'office365'
  params: {
    workspaceName: workspaceName
  }
}

//Azure Active directory Identity Protection and Microsoft 365 Defender
module demo3 './connectors/AzureActiveDirectory.bicep' = {
  name: 'AzureActiveDirectory'
  params: {
    workspaceName: workspaceName
  }
}

//Microsoft Defender for Cloud Apps
module demo4 './connectors/microsoftDefenderForCloudApps.bicep' = {
  name: 'microsoftDefenderForCloudApps'
  params: {
    workspaceName: workspaceName
  }
}


//Microsoft Defender for Cloud
module demo5 './connectors/MicrosoftDefenderforCloud.bicep' = {
  name: 'MicrosoftDefenderforCloud'
  params: {
    workspaceName: workspaceName
  }
}


//MicrosoftDefenderAdvancedThreatProtection, doesn't work
//module demo6 './connectors/MicrosoftDefenderAdvancedThreatProtection.bicep' = {
//  name: 'MicrosoftDefenderAdvancedThreatProtection'
//  params: {
//    workspaceName: workspaceName
//  }
//}

// UEBA ERIK 
// UEBA ERIK 
module EntityAnalytics './connectors/UEBA/EntityAnalytics.bicep'={
  name: 'EntityAnalytics'
  params: {
    workspaceName: workspaceName
  }
}

module Ueba './connectors/UEBA/UEBA.bicep'={
  name: 'Ueba'
  params: {
    workspaceName: workspaceName
  }
}

