pgadmin-run:
	docker run --name pgadmin -p 8000:80 --network xpay_network -e 'PGADMIN_DEFAULT_EMAIL=user@domain.com' -e 'PGADMIN_DEFAULT_PASSWORD=SuperSecret' -d dpage/pgadmin4

pgadmin-start:
	docker start pdadmin

pgadmin-destory:
	docker stop pgadmin && docker rm xpay_pgadmin 


.PHONY: pgadmin-up pgadmin-destroy

