# TRIST
 Репозиторій для предмету "Тенденції розвитку інформаційних систем та технологій", 13 семестр, КПІ.

## Lab 1:
Please check [report](https://github.com/JokerFunny/TRIST/blob/main/Reports/1.pdf). As it is deployed on-demand to AWS, I might change/terminate it.

[Github Actions workflow definition](https://github.com/JokerFunny/TRIST/blob/main/.github/workflows/docker-image.yml).

[Github Actions result](https://github.com/JokerFunny/TRIST/actions).

[DockerHub registry](https://hub.docker.com/r/joker759/trist-lr1/tags).

## Lab 2:
Please check [report](https://github.com/JokerFunny/TRIST/blob/main/Reports/2.pdf).

[Github Actions Terraform apply workflow definition](https://github.com/JokerFunny/TRIST/blob/main/.github/workflows/terraform.yml).

[Github Actions Terraform apply result](https://github.com/JokerFunny/TRIST/actions/workflows/terraform.yml).

[Github Actions Terraform destroy workflow definition](https://github.com/JokerFunny/TRIST/blob/main/.github/workflows/terraform-destroy.yml).

[Github Actions Terraform destroy result](https://github.com/JokerFunny/TRIST/actions/workflows/terraform-destroy.yml).

## Lab 3:
cd LR3/EFK-stack
docker-compose up -d

Open the EFKLoggingApi.sln, build, and start the app (or use docker, but the Elasticsearch endpoint needs to be changed for this).
Execute action(s) via swagger.

Open [Kibana](http://localhost:5601/) and check logs.

## Lab 4:
cd LR4
docker-compose up -d

Check [application](http://localhost:8080/swagger/index.html), and validate the application [metrics](http://localhost:8080/metrics).

Check [Prometheus](http://localhost:9090/targets) targets to ensure the application is registered.

Check [Grafana](http://localhost:3000/).

(for more details, please check the [report](https://github.com/JokerFunny/TRIST/blob/main/Reports/4.pdf))
