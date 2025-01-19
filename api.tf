resource "docker_container" "xpay" {
    name = "xpay_api"
    image = "xpay_api:latest"

    env = [
      "DB_URL=postgres://ash:samplepass@postgres:5432/xpay?sslmode=disable&timezone=UTC",
      "SERVER_ADDRESS=0.0.0.0:8080",
    ]

    ports {
    internal = 8080
    external = 8080
    }

    networks_advanced {
    name = docker_network.api.name
    }
    
    depends_on = [
      docker_container.postgres_1
    ]
    restart = "unless-stopped"
}
