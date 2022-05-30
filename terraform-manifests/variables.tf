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