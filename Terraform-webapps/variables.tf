variable "resource_group_name" {
  type = string
  description = "rg name"
}

variable "location" {
  type = string
  description = "resource location"
}

variable "DOCKER_REGISTRY_SERVER_URL" {
  type = string
}

variable "DOCKER_REGISTRY_SERVER_USERNAME" {
  type = string
}

variable "DOCKER_REGISTRY_SERVER_PASSWORD" {
  type = string
}