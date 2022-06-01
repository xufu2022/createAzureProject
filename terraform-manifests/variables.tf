variable "project_name" {
  default = "terrformtest1"
}

variable "work_item_template" {
  default = "Agile"
  #Options Agile, Basic, CMMI, Scrum
}

variable "project_type" {
  type    = string
  default = "Mvc"
}

variable "project_version" {
  type    = string
  default = "3.1"
}

variable "environment" {
  description = "Environment Name"
  type        = string
  default     = "dev"
}

variable "hostname" {
  type    = string
  default = "example"
}

variable "apppoolusername" {
  type    = string
  default = "username"
}

variable "apppoolpassword" {
  type    = string
  default = "Password"
}

variable "BuildConfiguration" {
  type    = string
  default = "release"
}

variable "BuildPlatform" {
  type    = string
  default = "any cpu"
}

variable "ASP_DeleteLogs" {
  type    = string
  default = "\\\\svr-prdfs\\DeploymentScript\\ASP_DeleteLogs.ps1"
}

variable "Delete_UnusedWebConfigs" {
  type    = string
  default = "\\\\svr-prdfs\\DeploymentScript\\Delete_UnusedWebConfigs.ps1"
}

variable "IIS_Settings" {
  type    = string
  default = "\\\\svr-prdfs\\DeploymentScript\\IIS_Settings.ps1"
}
variable "IIS_WebConfig" {
  type    = string
  default = "\\\\svr-prdfs\\DeploymentScript\\IIS_WebConfig.ps1"
}