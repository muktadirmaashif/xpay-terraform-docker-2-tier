resource "docker_network" "api" {
  name       = "xpay_network"
  attachable = true
}
