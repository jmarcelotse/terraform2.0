# Object

No Terraform, um objeto (object) é um tipo de dado que permite agrupar múltiplos valores sob um único nome, onde cada valor tem um tipo e uma chave associada. Objetos são úteis para estruturar dados complexos de maneira organizada e reutilizável, facilitando a gestão de várias propriedades relacionadas a um recurso ou configuração.

# Definindo Objetos

Objetos são definidos usando a palavra-chave object seguida por uma definição de tipos para cada chave dentro do objeto. Você pode definir objetos diretamente em variáveis, recursos e outputs.

exemplo de Variável de Objeto

hcl

variable "instance_config" {
  description = "Configuração da instância"
  type = object({
    ami           = string
    instance_type = string
    tags          = map(string)
  })
  default = {
    ami           = "ami-12345678"
    instance_type = "t2.micro"
    tags = {
      Name        = "example-instance"
      Environment = "dev"
    }
  }
}

# Usando Objetos em Recursos

Você pode usar objetos para configurar recursos de forma organizada, agrupando várias propriedades relacionadas. Aqui está um exemplo de como usar um objeto para definir a configuração de uma instância AWS EC2:

    hcl
    variable "instance_config" {
    description = "Configuração da instância"
    type = object({
        ami           = string
        instance_type = string
        tags          = map(string)
    })
    default = {
        ami           = "ami-12345678"
        instance_type = "t2.micro"
        tags = {
        Name        = "example-instance"
        Environment = "dev"
        }
    }
    }

    resource "aws_instance" "example" {
    ami           = var.instance_config.ami
    instance_type = var.instance_config.instance_type
    tags          = var.instance_config.tags
    }

# Acessando Propriedades de Objetos

Você pode acessar as propriedades de um objeto usando a notação de ponto **(.)**, como mostrado no exemplo acima.

# Funções Relacionadas a Objetos

Terraform oferece algumas funções para trabalhar com objetos, incluindo **merge()** e **coalesce()**.

**Exemplo de merge()**

A função **merge()** combina múltiplos objetos em um único objeto.

    hcl

    variable "default_tags" {
    description = "Tags padrão"
    type = map(string)
    default = {
        Environment = "dev"
        Project     = "example"
    }
    }

    variable "custom_tags" {
    description = "Tags personalizadas"
    type = map(string)
    default = {
        Owner = "user"
    }
    }

    output "merged_tags" {
    value = merge(var.default_tags, var.custom_tags)
    }

**Exemplo de coalesce()**

A função **coalesce()** retorna o primeiro valor não nulo de uma lista de argumentos.

    hcl

    variable "optional_value" {
    description = "Valor opcional"
    type = object({
        name = string
        value = string
    })
    default = null
    }

    output "resolved_value" {
    value = coalesce(var.optional_value.value, "default_value")
    }

# Uso de Objetos em Outputs

Objetos também podem ser usados em outputs para exibir dados complexos e estruturados.

**Exemplo de Output de Objeto**

    hcl

    variable "instance_config" {
    description = "Configuração da instância"
    type = object({
        ami           = string
        instance_type = string
        tags          = map(string)
    })
    default = {
        ami           = "ami-12345678"
        instance_type = "t2.micro"
        tags = {
        Name        = "example-instance"
        Environment = "dev"
        }
    }
    }

    output "instance_output" {
    description = "Configuração da instância"
    value       = var.instance_config
    }

# Resumo

 - **Definição de Objetos**: Use a palavra-chave **object** para definir objetos com várias propriedades.
 - **Uso em Recursos**: Utilize objetos para agrupar várias propriedades relacionadas em um único bloco de configuração.
 - **Acesso às Propriedades**: Use a notação de ponto **(.)** para acessar as propriedades de um objeto.
 - **Funções**: Utilize funções como **merge()** e **coalesce()** para manipular objetos.
 - **Outputs**: Exiba dados complexos e estruturados em outputs.

Objetos são extremamente úteis no Terraform para estruturar dados complexos de maneira organizada e flexível, permitindo a definição de configurações de infraestrutura mais modulares e reutilizáveis.