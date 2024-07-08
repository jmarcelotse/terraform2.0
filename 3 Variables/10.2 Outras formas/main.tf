variable "conteudo_string" {
  type        = string
  default     = "Teste"
  description = "Conteudo dentro do aquivos"
}

variable "lista_nomes" {
  type        = list(string)
  default     = ["Maquina01", "Maquina02", "Maquina03", "Maquina03"]
  description = "Lista de nomes"
}

resource "local_file" "arquivo_list" {
  content  = "Os nomes definidos foram ${join(", ", var.lista_nomes)}"
  filename = "arquivo-list.txt"
}

resource "local_file" "arquivo_string" {
  content  = var.conteudo_string
  filename = "arquivo-string.txt"
}
