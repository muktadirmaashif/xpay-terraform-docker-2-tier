resource "docker_container" "xpay" {
  count = var.api_count
  name  = "${var.api_container_name}_${count.index + 1}"
  image = var.api_image_name

  command = [
    "/bin/sh",
    "-c",
    <<-EOT
            while true; do
              if ! pg_isready -h ${var.pg_hostname} -p ${var.pg_port}; then
                export DB_PORT=${var.pg_port + 1}
              fi
              sleep 5
            done &
          EOT
  ]

  env = [
    "DB_URL=${var.pg_hostname}://${var.pg_user}:${var.pg_password}@${var.pg_hostname}:${var.pg_port}/${var.pg_db_name}?sslmode=disable&timezone=UTC",
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
    docker_container.postgres_1,
    docker_container.postgres_2
  ]
  healthcheck {
    test     = ["CMD-SHELL", "curl -f ${var.pg_hostname}:${var.pg_port}"]
    interval = "5s"
    timeout  = "3s"
    retries  = 3
  }
  restart = "always"
}
