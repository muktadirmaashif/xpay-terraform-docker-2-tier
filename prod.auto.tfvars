pg_image_name     = "postgres:17.0-alpine3.20"
pg_container_name = "xpay_postgres"
pg_port           = 5432
pg_count          = 2
pg_db_name        = "xpay"
pg_user           = "ash"
pg_password       = "samplepass"



pgadmin_image_name     = "dpage/pgadmin4:latest"
pgadmin_container_name = "pgadmin"
pgadmin_port           = 8000
pgadmin_email          = "ash@docker.com"
pgadmin_password       = "SuperSecret"




api_image_name     = "xpay_api:latest"
api_container_name = "xpay_api"
api_db_url         = "postgres://ash:samplepass@postgres:5432/xpay?sslmode=disable&timezone=UTC"
api_server_addr    = "0.0.0.0:8080"
api_port           = 8080
api_count          = 2




network_name = "xpay_network"
