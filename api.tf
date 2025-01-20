resource "docker_container" "xpay" {
  name  = var.api_container_name
  image = var.api_image_name

  env = [
    "DB_URL=${var.api_db_url}",
    "SERVER_ADDRESS=${var.api_server_addr}",
  ]

  ports {
    internal = var.api_port
    external = var.api_port
  }

  networks_advanced {
    name = docker_network.api.name
  }

  depends_on = [
    docker_container.postgres_1
  ]
  restart = "unless-stopped"
}
