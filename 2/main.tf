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

# Recurso para criar a instância EC2
resource "aws_instance" "vm-terraform" {
  ami                    = "ami-09040d770ffe2224f"  # ID da AMI do Ubuntu 20.04 LTS para a região us-east-2
  instance_type          = "t2.micro"               # Tipo da instância EC2
  key_name               = "terraform.pem"          # Nome da chave SSH já cadastrada na AWS (verifique se este é o nome correto)
  vpc_security_group_ids = ["sg-024ab82f1390a9ad5"] # IDs dos grupos de segurança para associar à instância

  root_block_device {
    volume_size = 30 # Tamanho do volume em GiB para o dispositivo root
  }

  tags = {
    Name = "vm-terraform" # Tags para a instância EC2 (facilita a identificação)
  }
}
