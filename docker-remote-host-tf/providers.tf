# Specify the required Docker provider and version for Terraform
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.1"
    }
  }
}

# Configure the Docker provider with the specified host and registry authentication
provider "docker" {
  host = var.docker_host
  registry_auth {
    address     = var.registry_address
    config_file = var.registry_config_file
  }
}
