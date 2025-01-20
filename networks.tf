resource "docker_network" "api" {
  name       = var.network_name
  attachable = true
}
