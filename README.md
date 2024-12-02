# TRIST
 Репозиторій для предмету "Тенденції розвитку інформаційних систем та технологій", 13 семестр, КПІ.

## Lab 1:
***

## Lab 2:
***

## Lab 3:
cd LR3/EFK-stack
docker-compose up -d

Open the EFKLoggingApi.sln, build, and start the app (or use docker, but the Elasticsearch endpoint needs to be changed for this).
Execute action(s) via swagger.

Open Kibana by http://localhost:5601/, and check logs.

## Lab 4:
cd LR4
docker-compose up -d

The application can be accessed at: http://localhost:8080/swagger/index.html

Validate the application metrics by visiting: http://localhost:8080/metrics

Check Prometheus targets to ensure the application is registered: http://localhost:9090/targets

Grafana can be accessed at: http://localhost:3000/
