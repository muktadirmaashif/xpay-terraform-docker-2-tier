resource "docker_container" "xpay" {
  count = var.api_count
  name  = "${var.api_container_name}_${count.index + 1}"
  image = var.api_image_name

  env = [
    "DB_URL=${var.api_db_url}",
    "SERVER_ADDRESS=${var.api_server_addr}",
  ]

  ports {
    internal = var.api_port
    external = var.api_port + count.index + 1
  }

  networks_advanced {
    name = docker_network.api.name
  }

  depends_on = [
    docker_container.postgres_1
  ]
  restart = "unless-stopped"
}
