resource "local_file" "foo" {
  content  = "O valor que eu vou usar de maquina é ${var.conteudo[0]} - ${var.conteudo[1]} - ${var.conteudo[2]}"
  filename = "./arquivo.txt"
}

variable "conteudo" {
  default     = ["nyc1", "media", false]
  type        = tuple([string, string, bool])
  description = "conteudo que vai para o arquivo"
}
