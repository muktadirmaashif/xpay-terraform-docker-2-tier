resource "docker_image" "postgres" {
  name         = var.pg_image_name
  keep_locally = true
}

resource "docker_container" "postgres_1" {
  name     = var.pg_container_name
  image    = docker_image.postgres.image_id
  hostname = var.pg_hostname

  env = [
    "POSTGRES_DB=${var.pg_db_name}",
    "POSTGRES_USER=${var.pg_user}",
    "POSTGRES_PASSWORD=${var.pg_password}",
  ]
  ports {
    internal = var.pg_port
    external = var.pg_port
  }

  networks_advanced {
    name = docker_network.api.name
  }

  healthcheck {
    test     = ["CMD-SHELL", "pg_isready -U ash -d xpay"]
    interval = "10s"
    timeout  = "5s"
    retries  = 3
  }

  volumes {
    volume_name    = docker_volume.pg_data.name
    container_path = var.pg_vol_main_cpath
  }
  volumes {
    volume_name    = docker_volume.pg_backup.name
    container_path = var.pg_vol_backup_cpath
  }
}

### pgadmin image and container
# ----------------------------
resource "docker_image" "pgadmin" {
  name         = var.pgadmin_image_name
  keep_locally = true
}

resource "docker_container" "xpay_pgadmin" {
  name  = var.pgadmin_container_name
  image = docker_image.pgadmin.image_id

  networks_advanced {
    name = docker_network.api.name
  }

  ports {
    internal = 80
    external = var.pgadmin_port
  }

  env = [
    "PGADMIN_DEFAULT_EMAIL=${var.pgadmin_email}",
    "PGADMIN_DEFAULT_PASSWORD=${var.pgadmin_password}",
  ]
}
