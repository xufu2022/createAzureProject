terraform {
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = ">=0.1.0"
    }
  }
}

provider "azuredevops" {
  org_service_url       = "https://dev.azure.com/FuXu0302"
  personal_access_token = "lve5e7bvfdpldveba6gjh2nmrlsukrxpfafalfbvv7tnyrw3gvha"
}