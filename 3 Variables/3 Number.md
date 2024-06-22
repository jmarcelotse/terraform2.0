# Number

No Terraform, números são um tipo de dado que representa valores numéricos, como inteiros ou floats. Eles são amplamente utilizados para definir quantidades, tamanhos, IDs numéricos, e outras configurações que requerem valores numéricos.

# Definindo Números

Números podem ser definidos diretamente em variáveis, recursos, e outputs. Aqui estão alguns exemplos de como definir e usar números no Terraform.

**Exemplo de Variável Numérica**

    hcl

    variable "instance_count" {
    description = "Número de instâncias"
    type        = number
    default     = 3
    }

# Usando Números em Recursos

Você pode usar números diretamente na configuração de recursos. Aqui está um exemplo de como usar uma variável numérica para definir a quantidade de instâncias a serem criadas:

    hcl
    resource "aws_instance" "example" {
    count         = var.instance_count
    ami           = "ami-12345678"
    instance_type = "t2.micro"
    }

# Operações Aritméticas

Terraform permite realizar operações aritméticas com números, o que pode ser útil para calcular valores dinamicamente.

Exemplo de Operações Aritméticas

    hcl

    variable "base_port" {
    description = "Porta base"
    type        = number
    default     = 8000
    }

    resource "aws_instance" "example" {
    count         = 3
    ami           = "ami-12345678"
    instance_type = "t2.micro"

    tags = {
        Name = "example-${count.index + var.base_port}"
    }
    }

# Funções para Manipulação de Números

Terraform oferece algumas funções úteis para trabalhar com números:

1. **abs()**: Retorna o valor absoluto de um número.
2. **ceil()**: Arredonda um número para cima para o inteiro mais próximo.
3. **floor()**: Arredonda um número para baixo para o inteiro mais próximo.
4. **max()**: Retorna o maior valor entre os números fornecidos.
5 **min()**: Retorna o menor valor entre os números fornecidos.

Exemplo de Uso de Funções Numéricas

    hcl

    variable "number1" {
    description = "Primeiro número"
    type        = number
    default     = -5
    }

    variable "number2" {
    description = "Segundo número"
    type        = number
    default     = 10
    }

    output "absolute_value" {
    value = abs(var.number1)
    }

    output "rounded_up" {
    value = ceil(4.2)
    }

    output "rounded_down" {
    value = floor(4.8)
    }

    output "maximum_value" {
    value = max(var.number1, var.number2)
    }

    output "minimum_value" {
    value = min(var.number1, var.number2)
    }

# Uso de Números em Outputs

Números também podem ser usados em outputs para exibir valores calculados ou derivados dos recursos provisionados.

**Exemplo de Output Numérico**

    hcl

    resource "aws_instance" "example" {
    count         = var.instance_count
    ami           = "ami-12345678"
    instance_type = "t2.micro"
    }

    output "total_instances" {
    description = "Número total de instâncias criadas"
    value       = length(aws_instance.example.*.id)
    }

Neste exemplo, o output **total_instances** exibe o número total de instâncias criadas usando a função **length()**.

# Resumo

 - **Definição de Variáveis**: Use o tipo number para definir variáveis numéricas.
 - **Operações**: Realize operações aritméticas diretamente nas configurações.
 - **Funções**: Utilize funções como abs(), ceil(), floor(), max(), e min() para manipular números.
 - **Outputs**: Use números em outputs para exibir informações derivadas.

Números são uma parte essencial da configuração do Terraform, permitindo cálculos dinâmicos e flexíveis na definição da infraestrutura.