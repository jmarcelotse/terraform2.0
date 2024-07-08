resource "local_file" "foo" {
  content  = "Conteudo do arquivo"
  filename = "./arquivo.txt"
}
