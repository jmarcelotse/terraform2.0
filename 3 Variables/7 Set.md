# Set

No Terraform, um conjunto (set) é um tipo de dado que representa uma coleção não ordenada de valores únicos. Ao contrário de listas, os conjuntos não garantem a ordem dos elementos, mas garantem que cada elemento seja único. Conjuntos são úteis quando você precisa garantir a unicidade dos valores e não se importa com a ordem dos mesmos.

# Definindo Conjuntos

Conjuntos são definidos de forma semelhante às listas, mas são tipicamente utilizados em contextos onde a unicidade dos valores é importante.

**Exemplo de Variável de Conjunto**

    hcl

    variable "unique_tags" {
    description = "Conjunto de tags únicas"
    type        = set(string)
    default     = ["tag1", "tag2", "tag3"]
    }

# Usando Conjuntos em Recursos

Você pode usar conjuntos para configurar recursos onde a ordem dos elementos não é importante, mas a unicidade é. Aqui está um exemplo de como usar um conjunto para definir tags únicas para um recurso:

    resource "aws_instance" "example" {
    ami           = "ami-12345678"
    instance_type = "t2.micro"

    tags = var.unique_tags
    }

# Operações Comuns com Conjuntos

Terraform oferece várias funções para manipulação de conjuntos, incluindo **length()**, **contains()**, **union()**, **intersection()**, **difference()**, entre outras.

**Exemplo de length()**

A função **length()** retorna o número de elementos em um conjunto.

    variable "unique_tags" {
    description = "Conjunto de tags únicas"
    type        = set(string)
    default     = ["tag1", "tag2", "tag3"]
    }

    output "number_of_tags" {
    value = length(var.unique_tags)
    }

**Exemplo de contains()**

A função **contains()** verifica se um valor específico está presente em um conjunto.

    hcl

    variable "unique_tags" {
    description = "Conjunto de tags únicas"
    type        = set(string)
    default     = ["tag1", "tag2", "tag3"]
    }

    output "contains_tag1" {
    value = contains(var.unique_tags, "tag1")
    }

**Exemplo de union()**

A função **union()** combina múltiplos conjuntos em um único conjunto, garantindo a unicidade dos elementos.

    hcl

    variable "tags1" {
    description = "Primeiro conjunto de tags"
    type        = set(string)
    default     = ["tag1", "tag2"]
    }

    variable "tags2" {
    description = "Segundo conjunto de tags"
    type        = set(string)
    default     = ["tag2", "tag3"]
    }

    output "combined_tags" {
    value = union(var.tags1, var.tags2)
    }

**Exemplo de intersection()**

A função **intersection()** retorna um conjunto contendo apenas os elementos que estão presentes em todos os conjuntos fornecidos.

    hcl

    variable "tags1" {
    description = "Primeiro conjunto de tags"
    type        = set(string)
    default     = ["tag1", "tag2"]
    }

    variable "tags2" {
    description = "Segundo conjunto de tags"
    type        = set(string)
    default     = ["tag2", "tag3"]
    }

    output "common_tags" {
    value = intersection(var.tags1, var.tags2)
    }


**Exemplo de difference()**

A função **difference()** retorna um conjunto contendo os elementos que estão presentes no primeiro conjunto, mas não no segundo.

    hcl
    variable "tags1" {
    description = "Primeiro conjunto de tags"
    type        = set(string)
    default     = ["tag1", "tag2"]
    }

    variable "tags2" {
    description = "Segundo conjunto de tags"
    type        = set(string)
    default     = ["tag2", "tag3"]
    }

    output "unique_to_tags1" {
    value = difference(var.tags1, var.tags2)
    }

**Uso de Conjuntos em Outputs**

Conjuntos também podem ser usados em outputs para exibir coleções de valores únicos.

**Exemplo de Output de Conjunto**

    hcl

    variable "unique_tags" {
    description = "Conjunto de tags únicas"
    type        = set(string)
    default     = ["tag1", "tag2", "tag3"]
    }

    output "tags_output" {
    description = "Tags únicas"
    value       = var.unique_tags
    }

# Resumo

 - **Definição de Conjuntos**: Use colchetes **{}** para definir conjuntos de valores únicos.
 - **Uso em Recursos**: Utilize conjuntos para configurar recursos onde a ordem não é importante, mas a unicidade dos valores é.
 - **Operações**: Utilize funções como **length()**, **contains()**, **union()**, **intersection()**, e **difference()** para manipular conjuntos.
 - **Outputs**: Exiba coleções de valores únicos em outputs.

Conjuntos são extremamente úteis no Terraform para garantir a unicidade dos valores e são uma parte importante na definição de configurações de infraestrutura flexíveis e eficientes.