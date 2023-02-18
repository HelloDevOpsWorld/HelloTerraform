# This resource defines a Docker image to be used in a container
# It pulls the image specified by the "nginx_image_name" variable from Docker Hub
# and instructs Docker to keep a local copy of the image on the host
# to improve performance and avoid repeated downloads.
resource "docker_image" "nginx" {
  name         = var.nginx_image_name
  keep_locally = true
}

# This resource defines a Docker container based on the "nginx" image
# It gives the container a name of "nginx" specified by the "nginx_container_name" variable
# and exposes the ports specified by the "nginx_internal_port" and "nginx_external_port" variables on the host
# that maps to port 80 on the container.
# The container is based on the "nginx" image defined in the previous resource
resource "docker_container" "nginx" {
  name  = var.nginx_container_name
  image = docker_image.nginx.name
  ports {
    internal = var.nginx_internal_port
    external = var.nginx_external_port
  }
}