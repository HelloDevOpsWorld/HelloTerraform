# Set the required provider and version
terraform {
  required_providers {
    # Define the Docker Provider to be used and its version
    # It is recommended to pin the version to ensure compatibility and avoid unexpected changes from new releases
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.1"
    }
  }
}

# Configure the Docker Provider
provider "docker" {
}

# Create a Docker Image resource
# The `docker_image` resource will pull the latest version of the nginx image
# from the Docker hub, and keep a local copy of the image in the system.
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}

# Create a Docker Container resource
# The `docker_container` resource will create and run a container from the latest version of the nginx image
# with the name "nginx". The container will expose port 8080 externally, and map it to port 80 internally.
resource "docker_container" "nginx" {
  name    = "nginx"
  image   = docker_image.nginx.image_id

  ports {
    external = 8080
    internal = 80
  }
}
