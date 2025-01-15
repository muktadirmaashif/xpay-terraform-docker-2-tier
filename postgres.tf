resource "docker_image" "postgres" {
  name         = "postgres:17.0-alpine3.20"
  keep_locally = true
}

resource "docker_container" "postgres_1" {
  name  = "xpay_postgres"
  image = docker_image.postgres.image_id

  env = [
    "POSTGRES_DB=xpay",
    "POSTGRES_USER=ash",
    "POSTGRES_PASSWORD=samplepass",
  ]
  ports {
    internal = 5432
    external = 5432
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
}

### pgadmin image and container
# ----------------------------
resource "docker_image" "pgadmin" {
  name         = "dpage/pgadmin4:latest"
  keep_locally = true
}

resource "docker_container" "xpay_pgadmin" {
  name  = "pgadmin"
  image = docker_image.pgadmin.image_id

  networks_advanced {
    name = docker_network.api.name
  }

  ports {
    internal = 80
    external = 8000
  }

  env = [
    "PGADMIN_DEFAULT_EMAIL=ash@docker.com",
    "PGADMIN_DEFAULT_PASSWORD=SuperSecret",
  ]
}
