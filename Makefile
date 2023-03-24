.PHONY: config
config:
	rm -rf clickhouse01 clickhouse02 clickhouse03
	mkdir -p clickhouse01 clickhouse02 clickhouse03
	SHARD=01 envsubst < config.xml > clickhouse01/config.xml
	SHARD=02 envsubst < config.xml > clickhouse02/config.xml
	SHARD=03 envsubst < config.xml > clickhouse03/config.xml
	cp users.xml clickhouse01/users.xml
	cp users.xml clickhouse02/users.xml
	cp users.xml clickhouse03/users.xml

.PHONY: up
up:
	docker-compose up -d

.PHONY: start
start:
	docker-compose start

.PHONY: down
down:
	docker-compose down
