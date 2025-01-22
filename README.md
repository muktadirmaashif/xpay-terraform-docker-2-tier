## Feature Release 

✅ Implemented | 🔄 In Progress/Planned

| Version | Features and Best Practices | Status |
|------|------------------------------|--------|
| v1.0 | • Single postgres db image and container provisioning <br>• Single backend api image and container provisioning<br>• Single Network provisioning <br>• pgadmin for db inspection| ✅<br>✅<br>✅ <br>✅ |
| v1.1 | Introduced and implemented regular and secret variables for all images and containers | ✅ |
| v1.2 | Introduced volumes for database containers to achieve persistent storage (one for regular and one for backup) | ✅ |
| v2.0 | • Added another api container <br>• Added another database container (backup, replication)<br>• Binding volumes to backup db container <br>• Isolated network for api and database containers | ✅<br>🔄<br>🔄<br>🔄 |
| v2.1 | • Introduced redis container for storing cache and application state <br>• Added another volume for redis (persistent wallet state, transaction history) | 🔄<br>🔄 |
| v2.2 | Introduced nginx for load balancing (application-level) | 🔄 |
| v2.3 | • Introduced Prometheus and Grafana for monitoring <br>• Prometheus metrics and Grafana dashboards|  🔄<br>🔄 |
| v3.0 | • Converting the provisioning for AWS <br>• AWS RDS with PostgreSQL<br>• ECS Fargate for serverless container deployment | 🔄<br>🔄<br>🔄 |


