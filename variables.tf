## POSTGRES VARIABLES
#####################
variable "pg_image_name" {
  description = "postgres image name"
  type        = string
}
variable "pg_container_name" {
  description = "postgres container name"
  type        = string
}
variable "pg_hostname" {
  description = "postgres hostname"
  type        = string
}
variable "pg_port" {
  description = "postgres port number"
  type        = number
}
variable "pg_count" {
  description = "number of postgres db"
  type        = number
}
variable "pg_db_name" {
  description = "postgres db name"
  type        = string
}
variable "pg_user" {
  description = "postgres username"
  type        = string
}
variable "pg_password" {
  description = "postgres db password"
  type        = string
  sensitive   = true
}
## ----- volumes ----------
variable "pg_vol_main" {
  description = "postgres main volume name"
  type        = string
}
variable "pg_vol_main_cpath" {
  description = "postgres main volume container path"
  type        = string
}

variable "pg_vol_backup" {
  description = "postgres backup volume name"
  type        = string
}
variable "pg_vol_backup_cpath" {
  description = "postgres backup volume container path"
  type        = string
}

## PGADMIN VARIABLES
####################
variable "pgadmin_image_name" {
  description = "pgadmin image name"
  type        = string
}
variable "pgadmin_container_name" {
  description = "pgadmin container name"
  type        = string
}
variable "pgadmin_port" {
  description = "pgadmin port number"
  type        = number
}
variable "pgadmin_email" {
  description = "pgadmin email"
  type        = string
}
variable "pgadmin_password" {
  description = "pgadmin password"
  type        = string
  sensitive   = true
}
## API VARIABLES
################
variable "api_image_name" {
  description = "api container name"
  type        = string
}
variable "api_container_name" {
  description = "api image name"
  type        = string
}
variable "api_db_url" {
  description = "full db url containing db credentials"
  type        = string
  sensitive   = true
}
variable "api_server_addr" {
  description = "full server address"
  type        = string
}
variable "api_port" {
  description = "api port number"
  type        = number
}
variable "api_count" {
  description = "number of api container"
  type        = number
}

## NETWORK VARIABLES
####################
variable "network_name" {
  description = "network name"
  type        = string
}

