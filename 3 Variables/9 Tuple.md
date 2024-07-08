# Tuple

No Terraform, tuplas (tuples) são um tipo de dado que representa uma coleção de valores de diferentes tipos. Ao contrário das listas, onde todos os elementos devem ser do mesmo tipo, uma tupla pode conter elementos de diferentes tipos, mas a ordem e o número de elementos são fixos. Tuplas são úteis quando você precisa agrupar um conjunto específico de valores heterogêneos.

## Definindo Tuplas

Tuplas são definidas usando a palavra-chave **tuple** seguida de uma lista de tipos. Cada elemento da tupla deve corresponder ao tipo especificado em sua posição.

## Exemplo de Variável de Tupla

        hcl

        variable "example_tuple" {
            description = "Uma tupla de valores heterogêneos"
            type        = tuple([string, number, bool])
            default     = ["example", 42, true]
        }

## Usando Tuplas em Recursos

Tuplas podem ser usadas para passar valores heterogêneos a recursos e módulos. Aqui está um exemplo de como usar uma tupla para definir múltiplos atributos de um recurso:

        hcl
        variable "instance_tuple" {
            description = "Configuração da instância como tupla"
            type        = tuple([string, string, map(string)])
            default     = ["ami-12345678", "t2.micro", {
                Name        = "example-instance"
                Environment = "dev"
            }]
        }

        resource "aws_instance" "example" {
            ami           = var.instance_tuple[0]
            instance_type = var.instance_tuple[1]
            tags          = var.instance_tuple[2]
        }

## Acessando Elementos de Tuplas

Você pode acessar os elementos de uma tupla usando a notação de índice **[]**, onde o índice começa em 0.

**Exemplo de Acesso a Elementos de Tupla**

        hcl

        variable "example_tuple" {
            description = "Uma tupla de valores heterogêneos"
            type        = tuple([string, number, bool])
            default     = ["example", 42, true]
        }

        output "first_element" {
            value = var.example_tuple[0]
        }

        output "second_element" {
            value = var.example_tuple[1]
        }

        output "third_element" {
            value = var.example_tuple[2]
        }

## Funções Relacionadas a Tuplas

Embora Terraform não tenha muitas funções específicas para tuplas, você pode usar funções gerais de listas, como **length()** e **element()**, com tuplas também.

**Exemplo de length()**

A função **length()** retorna o número de elementos em uma tupla.

        hcl
        variable "example_tuple" {
            description = "Uma tupla de valores heterogêneos"
            type        = tuple([string, number, bool])
            default     = ["example", 42, true]
        }

        output "tuple_length" {
            value = length(var.example_tuple)
        }

**Exemplo de element()**

A função **element()** retorna o elemento em um índice específico de uma tupla.

        hcl
        variable "example_tuple" {
            description = "Uma tupla de valores heterogêneos"
            type        = tuple([string, number, bool])
            default     = ["example", 42, true]
        }

        output "second_element" {
            value = element(var.example_tuple, 1)
        }

## Uso de Tuplas em Outputs

Tuplas também podem ser usadas em outputs para exibir coleções de valores heterogêneos.

**Exemplo de Output de Tupla**

        hcl

        variable "example_tuple" {
            description = "Uma tupla de valores heterogêneos"
            type        = tuple([string, number, bool])
            default     = ["example", 42, true]
        }

        output "tuple_output" {
            description = "Uma tupla de valores"
            value       = var.example_tuple
        }

**Resumo**

 - **Definição de Tuplas**: Use a palavra-chave tuple seguida de uma lista de tipos para definir tuplas.
 - **Uso em Recursos**: Utilize tuplas para passar valores heterogêneos a recursos e módulos.
 - **Acesso aos Elementos**: Use a notação de índice **[]** para acessar elementos de uma tupla.
 - **Funções**: Utilize funções como **length()** e **element()** para manipular tuplas.
 - **Outputs**: Exiba coleções de valores heterogêneos em outputs.

Tuplas são extremamente úteis no Terraform para agrupar valores de diferentes tipos de maneira estruturada e fixa, permitindo configurações mais flexíveis e organizadas.
