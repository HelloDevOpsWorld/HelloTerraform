# Define the Docker host URL variable
variable "docker_host" {
  type        = string
  description = "The Docker host URL to connect to."
}

# Define the Docker registry address variable
variable "registry_address" {
  type        = string
  description = "The registry address for Docker."
}

# Define the path to the Docker registry config file variable
variable "registry_config_file" {
  type        = string
  description = "The path to the Docker registry config file."
}

# These variables allow for customization of the image and container settings

# The name of the Docker image to use for the nginx container
variable "nginx_image_name" {
  type        = string
  description = "The name of the Docker image to use for the nginx container"
  default     = "nginx:latest"
}

# The name to use for the nginx container
variable "nginx_container_name" {
  type        = string
  description = "The name to use for the nginx container"
  default     = "nginx"
}

# The port number to use for the nginx container's internal port
variable "nginx_internal_port" {
  type        = number
  description = "The port number to use for the nginx container's internal port"
  default     = 80
}

# The port number to use for the nginx container's external port
variable "nginx_external_port" {
  type        = number
  description = "The port number to use for the nginx container's external port"
  default     = 8000
}