terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configura o provedor AWS
provider "aws" {
  region = "us-east-2" # Define a região onde os recursos serão criados
}

# Recurso para o grupo de segurança
resource "aws_security_group" "terraform_sg" {
  name        = "terraform_sg"
  description = "Security group for teste terraf"
  vpc_id      = "vpc-095665fcc889de9ca" # ID da sua formVPC

  # Regras de entrada
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Permitir tráfego SSH de qualquer IP
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Permitir tráfego HTTP de qualquer IP
  }

  # Regras de saída
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # Permite todo o tráfego de saída
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-sg"
  }
}

# Recurso para criar a instância EC2
resource "aws_instance" "vm-terraform" {
  ami                    = "ami-09040d770ffe2224f"              # Ubuntu 20.04 LTS AMI ID para us-east-2
  instance_type          = "t2.micro"                           # Tipo da instância EC2
  key_name               = "terraform"                          # Nome da chave SSH já cadastrada na AWS (verifique se este é o nome correto)
  vpc_security_group_ids = [aws_security_group.terraform_sg.id] # Referência ao grupo de segurança criado

  root_block_device {
    volume_size = 30 # Tamanho do volume em GiB para o dispositivo root
  }

  tags = {
    Name = "vm-terraform" # Tags para a instância EC2 (facilita a identificação)
  }
}
