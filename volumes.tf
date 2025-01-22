resource "docker_volume" "pg_data" {
  name = var.pg_vol_main
}

resource "docker_volume" "pg_backup" {
  name = var.pg_vol_backup
}
