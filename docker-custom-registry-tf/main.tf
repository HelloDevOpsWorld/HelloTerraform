# Set the required provider and version
# The `terraform` block defines the required Terraform providers to be used in the configuration.
# It also allows to specify the version of the provider, which is recommended to be pinned to ensure compatibility and avoid unexpected changes from new releases.
terraform {
  required_providers {
    # Define the Docker Provider to be used and its version
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.1"
    }
  }
}

# Configure the Docker Provider
# The `provider` block is used to configure the Docker provider.
# This configuration block tells Terraform to use the Docker registry credentials stored in `~/.docker/config.json`
# for authentication when interacting with the Docker registry.
provider "docker" {
  registry_auth {
    address = "hub.docker.com"
    config_file = pathexpand("~/.docker/config.json")
  }
}

# Create a Docker Image resource
# The `docker_image` resource tells Terraform to pull the specified version of the nginx image
# from the Docker registry, and keep a local copy of the image in the system.
# The `name` attribute specifies the image to be pulled, in the format `<registry>/<image>:<tag>`.
# The `keep_locally` attribute tells Terraform to keep a local copy of the image on the system, so that it can be reused between runs.
resource "docker_image" "nginx" {
  name         = "rabiielbeji/nginx:latest"
  keep_locally = true
}

# Create a Docker Container resource
# The `docker_container` resource tells Terraform to create and run a container from the specified version of the nginx image.
# The `name` attribute specifies the name of the container.
# The `image` attribute specifies the image to be used for the container, using the `image_id` attribute of the `docker_image` resource.
# The `ports` block maps the specified ports between the host and the container.
# In this case, port 8080 on the host is mapped to port 80 in the container.
resource "docker_container" "nginx" {
  name    = "nginx"
  image   = "${docker_image.nginx.image_id}"

  ports {
    # Map port 8080 on the host to port 80 in the container
    external = 8080
    internal = 80
  }
}
