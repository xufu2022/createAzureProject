locals {
  Global = {
    ApppoolUsername    = "${var.apppoolusername}"
    ApppoolPassword    = "${var.apppoolpassword}"
    BuildConfiguration = "${var.BuildConfiguration}"
    BuildPlatform      = "${var.BuildPlatform}"
    DeploymentPath     = "D:\\Websites\\${var.hostname}"
    DeleteLogs         = "${var.ASP_DeleteLogs}"
    UnusedWebConfigs   = "${var.Delete_UnusedWebConfigs}"
    IIS_Settings       = "${var.IIS_Settings}"
    IIS_WebConfig      = "${var.IIS_WebConfig}"
    Log_Enabled        = true
    Log_Path           = "\\\\svr-prdfs\\$(ASPNETCORE_ENVIRONMENT)\\Logs\\$(Hostname)\\$(Agent.MachineName)"
  }
  Testing = {
    Web = {
      Machine          = "Name0",
      Server           = "SVR-POCWEB",
      Alias            ="SVR",
      BindingIpAddress = ["10.29.12.161", "10.29.12.162"]
    }
    API = {
      Machine          = "Name0",
      Server           = "SVR-POCAPI0",
      BindingIpAddress = ["10.29.12.164", "10.29.12.165"]
    }
  }
  Staging = {
    Web = {
      Machine          = "Name0",
      Server           = "SVR-POCWEB",
      Alias            ="SVR",
      BindingIpAddress = ["10.29.12.161", "10.29.12.162"]
    }
    API = {
      Machine          = "Name0",
      Server           = "SVR-POCAPI0",
      BindingIpAddress = ["10.29.12.164", "10.29.12.165"]
    }
  }
  Production = {
    Web = {
      Machine          = "Name0",
      Server           = "SVR-PRDWEB",
      Alias            ="SVR",
      BindingIpAddress = ["172.29.12.81", "172.29.12.82", "172.29.12.83", "172.29.12.84", "172.29.12.85"]
    }
    API = {
      Machine          = "Name0",
      Server           = "SVR-PRDAPI0",
      BindingIpAddress = ["10.29.12.111", "10.29.12.112", "10.29.12.113", "10.29.12.114", "10.29.12.115"]
    }
  }
}


