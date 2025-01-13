resource "docker_image" "nginx" {
        name = "nginx:latest"

    }

resource "docker_container" "nginx_test" {
  name  = "nginx-terraform"
  image = docker_image.nginx.latest

  ports {
    internal = 80
    external = 8080
  }
}

output "nginx-details" {
  value = docker_image.nginx
}

