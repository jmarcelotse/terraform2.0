variable "Name" {
  default     = "vm-terraform"
  description = "Nome para a tag da instância EC2"
}

variable "ami" {
  default     = "ami-09040d770ffe2224f"
  description = "ID da AMI para a instância EC2"
}

variable "region" {
  default     = "us-east-2"
  description = "Região onde os recursos serão criados"
}

variable "volume_size" {
  default     = "30"
  description = "Tamanho do volume em GiB para o dispositivo root"
}

variable "key_name" {
  default     = "terraform"
  description = "Nome da chave SSH para acesso à instância EC2"
}
