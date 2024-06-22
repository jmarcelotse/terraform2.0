# List

No Terraform, listas são um tipo de dado que representa uma sequência ordenada de valores. As listas são usadas para armazenar múltiplos itens, como strings, números, ou até mesmo outras listas. Elas são extremamente úteis para gerenciar coleções de recursos ou para passar múltiplos valores para variáveis.

# Definindo Listas

Listas são definidas usando colchetes **[]** e os valores são separados por vírgulas. Você pode definir listas diretamente em variáveis, recursos e outputs.

**Exemplo de Variável de Lista**

hcl

variable "subnet_ids" {
  description = "Lista de IDs de subnets"
  type        = list(string)
  default     = ["subnet-12345678", "subnet-23456789", "subnet-34567890"]
}

# Usando Listas em Recursos

Você pode usar listas para configurar recursos que aceitam múltiplos valores. Aqui está um exemplo de como usar uma lista de IDs de subnets em um recurso:

    hcl
    resource "aws_instance" "example" {
    count         = length(var.subnet_ids)
    ami           = "ami-12345678"
    instance_type = "t2.micro"
    subnet_id     = element(var.subnet_ids, count.index)
    }

# Operações Comuns com Listas

Terraform oferece várias funções para manipulação de listas, incluindo **length()**, **element()**, **concat()**, **join()**, **split()**, **distinct()**, **flatten()**, entre outras.

**Exemplo de length()**

A função **length()** retorna o número de elementos em uma lista.

    hcl

    variable "subnet_ids" {
    description = "Lista de IDs de subnets"
    type        = list(string)
    default     = ["subnet-12345678", "subnet-23456789", "subnet-34567890"]
    }

    output "number_of_subnets" {
    value = length(var.subnet_ids)
    }

**Exemplo de element()**

A função **element()** retorna um elemento específico de uma lista com base no índice.

    hcl
    variable "subnet_ids" {
    description = "Lista de IDs de subnets"
    type        = list(string)
    default     = ["subnet-12345678", "subnet-23456789", "subnet-34567890"]
    }

    output "first_subnet" {
    value = element(var.subnet_ids, 0)
    }

**Exemplo de concat()**

A função **concat()** combina múltiplas listas em uma única lista.

    hcl
    variable "subnet_ids1" {
    description = "Primeira lista de IDs de subnets"
    type        = list(string)
    default     = ["subnet-12345678", "subnet-23456789"]
    }

    variable "subnet_ids2" {
    description = "Segunda lista de IDs de subnets"
    type        = list(string)
    default     = ["subnet-34567890", "subnet-45678901"]
    }

    output "all_subnets" {
    value = concat(var.subnet_ids1, var.subnet_ids2)
    }

**Exemplo de join()**

A função **join()** une elementos de uma lista em uma única string, separada por um delimitador.

    hcl
    variable "subnet_ids" {
    description = "Lista de IDs de subnets"
    type        = list(string)
    default     = ["subnet-12345678", "subnet-23456789", "subnet-34567890"]
    }

    output "joined_subnets" {
    value = join(", ", var.subnet_ids)
    }

**Exemplo de split()**

A função **split()** divide uma string em uma lista com base em um delimitador.

    hcl
    variable "comma_separated_subnets" {
    description = "Subnets separadas por vírgula"
    type        = string
    default     = "subnet-12345678,subnet-23456789,subnet-34567890"
    }

    output "subnets_list" {
    value = split(", ", var.comma_separated_subnets)
    }

# Uso de Listas em Outputs

Listas também podem ser usadas em outputs para exibir coleções de valores.

**Exemplo de Output de Lista**

    hcl

    variable "subnet_ids" {
    description = "Lista de IDs de subnets"
    type        = list(string)
    default     = ["subnet-12345678", "subnet-23456789", "subnet-34567890"]
    }

    output "subnet_ids_output" {
    description = "IDs das subnets"
    value       = var.subnet_ids
    }

# Resumo

 - **Definição de Listas**: Use colchetes [] para definir listas de valores.
 - **Uso em Recursos**: Utilize listas para configurar recursos que aceitam múltiplos valores.
 - **Operações**: Utilize funções como **length()**, **element()**, **concat()**, **join()**, e **split()** para manipular listas.
    Outputs: Exiba listas de valores em outputs.

Listas são um componente essencial nas configurações do Terraform, permitindo a gestão eficiente de múltiplos valores e aumentando a flexibilidade e a reutilização das definições de infraestrutura.