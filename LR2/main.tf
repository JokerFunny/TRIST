# Встановлення провайдера AWS.
provider "aws" {
  region = "eu-central-1"
}

# Створення Security Group.
resource "aws_security_group" "trist_lab2_sg" {
  name        = "trist-lab2-sg"
  description = "Allow SSH, HTTPS, and HTTP traffic"

  # Вхідний трафік (ingress rules).
  ingress {
    description = "Allow SSH traffic from your IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["212.110.138.79/32"] # Мій IP адрес (якщо вже брати аналогію з минулою ЛР).
  }

  ingress {
    description = "Allow HTTPS traffic from anywhere"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # HTTPS з будь-якого місця.
  }

  ingress {
    description = "Allow HTTP traffic from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # HTTP з будь-якого місця.
  }

  # Вихідний трафік (egress rules).
  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # Всі протоколи.
    cidr_blocks = ["0.0.0.0/0"] # Вихідний трафік до будь-якого місця.
  }

  tags = {
    Name = "trist-lr2"
  }
}

# Створення EC2 інстансу.
resource "aws_instance" "trist_lab2_web" {
  ami           = "ami-0084a47cc718c111a" # ubuntu-noble-24.04-amd64-server-20240927.
  instance_type = "t2.micro"
  key_name      = "keys-lr1"

  security_groups = [aws_security_group.trist_lab2_sg.name]

  # Встановлення Docker, запуск застосунку з ЛР1 + watchtower.
  user_data = <<EOF
#!/bin/bash
sudo apt update
sudo apt install -y docker.io
sudo usermod -aG docker $USER
newgrp docker
docker run -d -p 80:80 --name rist-lr1 joker759/trist-lr1:latest
docker ps -a
docker run -d --name watchtower -v /var/run/docker.sock:/var/run/docker.sock -e WATCHTOWER_CLEANUP=true -e WATCHTOWER_POLL_INTERVAL=120 containrrr/watchtower
docker ps -a
docker logs watchtower
EOF

  tags = {
    Name = "trist-lr2"
  }
}

# Вихідні дані: Public IP
output "instance_ip" {
  description = "Public IP of EC2 instance"
  value       = aws_instance.trist_lab2_web.public_ip
}

# Вихідні дані: Application URL
output "nginx_url" {
  description = "Address of the deployed application"
  value       = "http://${aws_instance.trist_lab2_web.public_ip}"
}
