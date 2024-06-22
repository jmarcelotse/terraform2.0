resource "local_file" "foo" {
  content  = var.conteudo
  filename = "./arquivo.txt"
}

variable "conteudo" {
  default     = "Conteudo do arquivo"
  type        = string
  description = "conteudo que vai para o arquivo"
}
