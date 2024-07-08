resource "local_file" "foo" {
  content  = "O valor que eu vou usar de maquina é ${join(", ", var.conteudo)}"
  filename = "./arquivo.txt"
}

variable "conteudo" {
  default = ["s-1vcpu-2gb", "s-2vcpu-4gb", "s-4vcpu-8gb"]

  type        = set(string)
  description = "conteudo que vai para o arquivo"
}
