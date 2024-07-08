resource "local_file" "foo" {
  content  = "O valor que eu vou usar de maquina é ${var.conteudo.regiao} - ${var.conteudo.opcao_maquina} - ${var.conteudo.fazer_bkp}"
  filename = "./arquivo.txt"
}

variable "conteudo" {
  default = {
    regiao        = "nyc1",
    opcao_maquina = "media",
    fazer_bkp     = false
  }

  type = object({
    regiao        = string,
    opcao_maquina = string,
    fazer_bkp     = bool
  })
  description = "conteudo que vai para o arquivo"
}
