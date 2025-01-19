resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true

}

resource "docker_container" "nginx_test" {
  name  = "nginx-terraform"
  image = docker_image.nginx.image_id

  ports {
    internal = 80
    external = 8088
  }

  networks_advanced {
    name = docker_network.api.name
  }
}
