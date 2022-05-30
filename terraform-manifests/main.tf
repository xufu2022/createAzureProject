

## Create team project for the commercial team
resource "azuredevops_project" "terrproj" {
  name               = "${var.project_name}"
  description        = "Repository test by myself"
  visibility         = "private"
  version_control    = "Git"
  work_item_template = "${var.work_item_template}"

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
    value = "Test"
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
    value = "Staging"
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
    value = "Production"
  }
}
