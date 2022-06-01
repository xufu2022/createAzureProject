

## Create team project for the commercial team
resource "azuredevops_project" "terrproj" {
  name               = var.project_name
  description        = "Repository test by myself"
  visibility         = "private"
  version_control    = "Git"
  work_item_template = var.work_item_template

  features = {
    "boards"       = "enabled"
    "repositories" = "enabled"
    "pipelines"    = "enabled"
    "testplans"    = "enabled"
    "artifacts"    = "enabled"
  }
}

resource "azuredevops_git_repository" "terrrepo" {
  project_id = azuredevops_project.terrproj.id
  name       = "${var.project_name}_Repo"
  initialization {
    init_type = "Clean"
  }
}

resource "azuredevops_git_repository_file" "terrfile" {
  repository_id       = azuredevops_git_repository.terrrepo.id
  file                = ".gitignore"
  content             = "**/*.tfstate"
  branch              = "refs/heads/master"
  commit_message      = "First commit"
  overwrite_on_create = false
}

resource "azuredevops_variable_group" "Global" {
  project_id   = azuredevops_project.terrproj.id
  name         = "Global Variable Group"
  description  = "Global variable group"
  allow_access = true

  variable {
    name  = "Apppool.Password"
    value = local.Global.ApppoolPassword
  }
  variable {
    name  = "Apppool.Username"
    value = local.Global.ApppoolUsername
  }
  variable {
    name  = "BuildConfiguration"
    value = local.Global.BuildConfiguration
  }
  variable {
    name  = "BuildPlatform"
    value = local.Global.BuildPlatform
  }
  variable {
    name  = "Deployment.Path"
    value = local.Global.DeploymentPath
  }
  variable {
    name  = "DS.ASP_DeleteLogs.Path"
    value = local.Global.DeleteLogs
  }
  variable {
    name  = "DS.Delete_UnusedWebConfigs.Path"
    value = local.Global.UnusedWebConfigs
  }
  variable {
    name  = "DS.IIS_WebConfig.Path"
    value = local.Global.IIS_WebConfig
  }
  variable {
    name  = "Log.Enabled"
    value = local.Global.Log_Enabled
  }
  variable {
    name  = "Log.Path"
    value = local.Global.Log_Path
  }
  variable {
    name  = "DS.IIS_Settings.Path"
    value = "\\\\svr-prdfs\\DeploymentScript\\IIS_Settings.ps1"
  }
}
resource "azuredevops_variable_group" "TestEnvironmentDetails" {
  project_id   = azuredevops_project.terrproj.id
  name         = "Test Environment Details variable group"
  description  = "Test Environment Details variable group"
  allow_access = true

  variable {
    name  = "ASPNETCORE_ENVIRONMENT"
    value = "Test"
  }
  variable {
    name  = "Hostname"
    value = "${var.hostname}-test.incommunities.co.uk"
  }

  dynamic "variable"{
    for_each   = { for idx, ipaddress in local.Testing.Web.BindingIpAddress: ipaddress => idx}
    content{
         name  = "Machine.Name0${variable.value + 1}"
         value = "${local.Testing.Web.Server}0${variable.value + 1}"
    }
  }

  dynamic "variable"{
    for_each   = { for idx, ipaddress in local.Testing.Web.BindingIpAddress: ipaddress => idx}
    content{
        name  = "${local.Testing.Web.Alias}0${variable.value + 1}.BindingIpAddress"
        value = "${local.Testing.Web.BindingIpAddress[variable.value]}"
    }
  }

}

resource "azuredevops_variable_group" "StagingEnvironmentDetails" {
  project_id   = azuredevops_project.terrproj.id
  name         = "Staging Environment Details variable group"
  description  = "Staging Environment Details variable group"
  allow_access = true

  variable {
    name  = "ASPNETCORE_ENVIRONMENT"
    value = "Staging"
  }

  variable {
    name  = "Hostname"
    value = "${var.hostname}-stage.incommunities.co.uk"
  }

  dynamic "variable"{
    for_each   = { for idx, ipaddress in local.Staging.Web.BindingIpAddress: ipaddress => idx}
    content{
         name  = "Machine.Name0${variable.value + 1}"
         value = "${local.Staging.Web.Server}0${variable.value + 1}"
    }
  }

  dynamic "variable"{
    for_each   = { for idx, ipaddress in local.Staging.Web.BindingIpAddress: ipaddress => idx}
    content{
        name  = "${local.Staging.Web.Alias}0${variable.value + 1}.BindingIpAddress"
        value = "${local.Staging.Web.BindingIpAddress[variable.value]}"
    }
  }
}
resource "azuredevops_variable_group" "ProductionEnvironmentDetails" {
  project_id   = azuredevops_project.terrproj.id
  name         = "Production Environment Details variable group"
  description  = "Production Environment Details variable group"
  allow_access = true

  variable {
    name  = "ASPNETCORE_ENVIRONMENT"
    value = "Production"
  }
  variable {
    name  = "Hostname"
    value = "${var.hostname}.incommunities.co.uk"
  }

  dynamic "variable"{
    for_each   = { for idx, ipaddress in local.Production.Web.BindingIpAddress: ipaddress => idx}
    content{
         name  = "Machine.Name0${variable.value + 1}"
         value = "${local.Production.Web.Server}0${variable.value + 1}"
    }
  }

  dynamic "variable"{
    for_each   = { for idx, ipaddress in local.Production.Web.BindingIpAddress: ipaddress => idx}
    content{
        name  = "${local.Production.Web.Alias}0${variable.value + 1}.BindingIpAddress"
        value = "${local.Production.Web.BindingIpAddress[variable.value]}"
    }
  }
}
