terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.16.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_container" "nginx_test" {
  name  = "nginx-terraform"
  image = "nginx-server:latest"

  ports {
    internal = 80
    external = 8080
  }
}

output "nginx-ip" {
  value = docker_container.nginx_test.ip_address
}

