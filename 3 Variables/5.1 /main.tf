resource "local_file" "foo" {
  content  = "O valor que eu vou usar de maquina é ${var.conteudo[4]}"
  filename = "./arquivo.txt"
}

variable "conteudo" {
  default     = ["Maquina", "Maquina1", "Maquina2", "Maquina3", "Maquina4", ]
  type        = list(string)
  description = "conteudo que vai para o arquivo"
}
