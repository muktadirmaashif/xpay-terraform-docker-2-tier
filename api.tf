resource "docker_container" "xpay" {
  count = var.api_count
  name  = "${var.api_container_name}_${count.index + 1}"
  image = var.api_image_name

  env = [
    "DB_URL=${var.pg_hostname}://${var.pg_user}:${var.pg_password}@${var.pg_hostname}_2:${var.pg_port}/${var.pg_db_name}?sslmode=disable&timezone=UTC",
    "SERVER_ADDRESS=${var.api_server_addr}",
  ]

  # healthcheck {
  #  test     = ["CMD", "curl -f ${var.pg_hostname}_2:${var.pg_port}"]
  #  interval = "5s"
  #  timeout  = "3s"
  #  retries  = 3
  # }

  ports {
    internal = var.api_port
    external = var.api_port + count.index + 1
  }

  networks_advanced {
    name = docker_network.api.name
  }

  volumes {
    volume_name    = docker_volume.db_state.name
    container_path = "/app"
  }

  depends_on = [
    docker_container.postgres_1,
    docker_container.postgres_2
  ]
  restart = "always"
}
