## Feature Release 

✅ Implemented | 🔄 In Progress/Planned

| Version | Features and Best Practices | Status |
|------|------------------------------|--------|
| v1.0 | • Single postgres db image and container provisioning <br>• Single backend api image and container provisioning<br>• Single Network provisioning <br>• pgadmin for db inspection| ✅<br>✅<br>✅ <br>✅ |
| v1.1 | Introduced and implemented regular and secret variables for all images and containers | ✅ |
| v1.2 | Introduced volumes for database containers to achieve persistent storage (one for regular and one for backup) | ✅ |
| v2.0 |• Added another api container <br>• Added another database container (secondary, replicated)<br>• Binding volumes to backup db container| ✅ <br>✅<br>✅|
| v2.1 | • Introduced docker swarm, declared one db and one api service as master nodes <br> • Reprovisioned the api and db containers as services for convenience <br> • Network Isolation for api-db communinication | 🔄<br>🔄 <br>🔄 |
| v2.2 |• Introduced load balancer for api services <br>• Implemented db connection failover script to ensure high availability | 🔄 <br>🔄 |
| v2.3 | • Introduced Prometheus and Grafana for monitoring <br>• Prometheus metrics and Grafana dashboards|  🔄<br>🔄 |
| v3.0 | • Provisioning for AWS <br>• AWS RDS with PostgreSQL<br>• ECS Fargate for serverless container deployment | 🔄<br>🔄<br>🔄 |


