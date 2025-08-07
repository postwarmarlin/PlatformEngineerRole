# Variables 

variable "location" {
  description = "Azure location for the Development resources"
  type        = string
  default     = "UK South"
}

variable "resource_group_name" {
  description = "Name of the Resource Group. Based on location & enviornment type"
  type        = string
}

variable "app_service_plan_name" {
  description = "Name of the Development Environment App Service Plan"
  type        = string
}

variable "web_app_name" {
  description = "Name of the Web App"
  type        = string
}

variable "docker_image_name" {
  description = "Docker image to deploy"
  type        = string
}
