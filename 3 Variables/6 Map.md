# Map

No Terraform, mapas (maps) são um tipo de dado que permite armazenar pares chave-valor. Eles são úteis para representar configurações onde cada chave está associada a um valor específico, tornando mais fácil a gestão de múltiplos parâmetros de configuração de forma organizada e eficiente.

# Definindo Mapas

Os mapas são definidos usando chaves e valores entre chaves **{}**. Você pode definir mapas diretamente em variáveis, recursos e outputs.

**Exemplo de Variável de Mapa**

    hcl

    variable "instance_types" {
    description = "Tipos de instâncias para diferentes ambientes"
    type        = map(string)
    default     = {
        dev  = "t2.micro"
        prod = "m5.large"
    }
    }

# Usando Mapas em Recursos

Você pode usar mapas para configurar recursos de forma dinâmica com base em valores de chaves específicas. Aqui está um exemplo de como usar um mapa para definir o tipo de instância com base em um ambiente especificado:

    hcl

    variable "environment" {
    description = "Ambiente para o qual os recursos serão criados"
    type        = string
    default     = "dev"
    }

    variable "instance_types" {
    description = "Tipos de instâncias para diferentes ambientes"
    type        = map(string)
    default     = {
        dev  = "t2.micro"
        prod = "m5.large"
    }
    }

    resource "aws_instance" "example" {
    ami           = "ami-12345678"
    instance_type = var.instance_types[var.environment]
    }

# Operações Comuns com Mapas

Terraform oferece várias funções para manipulação de mapas, incluindo **lookup()**, **merge()**, **keys()**, **values()**, entre outras.

**Exemplo de lookup()**

A função **lookup()** retorna o valor de uma chave específica em um mapa, permitindo definir um valor padrão caso a chave não exista.

    hcl

    variable "instance_types" {
    description = "Tipos de instâncias para diferentes ambientes"
    type        = map(string)
    default     = {
        dev  = "t2.micro"
        prod = "m5.large"
    }
    }

    output "dev_instance_type" {
    value = lookup(var.instance_types, "dev", "t2.small")
    }

**Exemplo de merge()**

A função **merge()** combina múltiplos mapas em um único mapa.

    hcl

    variable "map1" {
    description = "Primeiro mapa de configuração"
    type        = map(string)
    default     = {
        key1 = "value1"
        key2 = "value2"
    }
    }

    variable "map2" {
    description = "Segundo mapa de configuração"
    type        = map(string)
    default     = {
        key3 = "value3"
        key4 = "value4"
    }
    }

    output "merged_map" {
    value = merge(var.map1, var.map2)
    }

**Exemplo de keys() e values()**

As funções **keys()** e **values()** retornam as chaves e valores de um mapa, respectivamente.

    hcl

    variable "instance_types" {
    description = "Tipos de instâncias para diferentes ambientes"
    type        = map(string)
    default     = {
        dev  = "t2.micro"
        prod = "m5.large"
    }
    }

    output "map_keys" {
    value = keys(var.instance_types)
    }

    output "map_values" {
    value = values(var.instance_types)
    }


# Uso de Mapas em Outputs

Mapas também podem ser usados em outputs para exibir coleções de pares chave-valor.

**Exemplo de Output de Mapa**

    hcl

    variable "tags" {
    description = "Tags para recursos"
    type        = map(string)
    default     = {
        Name        = "example-instance"
        Environment = "dev"
    }
    }

    output "resource_tags" {
    description = "Tags dos recursos"
    value       = var.tags
    }

No Terraform, mapas (maps) são um tipo de dado que permite armazenar pares chave-valor. Eles são úteis para representar configurações onde cada chave está associada a um valor específico, tornando mais fácil a gestão de múltiplos parâmetros de configuração de forma organizada e eficiente.
Definindo Mapas

Os mapas são definidos usando chaves e valores entre chaves {}. Você pode definir mapas diretamente em variáveis, recursos e outputs.
Exemplo de Variável de Mapa

hcl

variable "instance_types" {
  description = "Tipos de instâncias para diferentes ambientes"
  type        = map(string)
  default     = {
    dev  = "t2.micro"
    prod = "m5.large"
  }
}

Usando Mapas em Recursos

Você pode usar mapas para configurar recursos de forma dinâmica com base em valores de chaves específicas. Aqui está um exemplo de como usar um mapa para definir o tipo de instância com base em um ambiente especificado:

hcl

variable "environment" {
  description = "Ambiente para o qual os recursos serão criados"
  type        = string
  default     = "dev"
}

variable "instance_types" {
  description = "Tipos de instâncias para diferentes ambientes"
  type        = map(string)
  default     = {
    dev  = "t2.micro"
    prod = "m5.large"
  }
}

resource "aws_instance" "example" {
  ami           = "ami-12345678"
  instance_type = var.instance_types[var.environment]
}

Operações Comuns com Mapas

Terraform oferece várias funções para manipulação de mapas, incluindo lookup(), merge(), keys(), values(), entre outras.
Exemplo de lookup()

A função lookup() retorna o valor de uma chave específica em um mapa, permitindo definir um valor padrão caso a chave não exista.

hcl

variable "instance_types" {
  description = "Tipos de instâncias para diferentes ambientes"
  type        = map(string)
  default     = {
    dev  = "t2.micro"
    prod = "m5.large"
  }
}

output "dev_instance_type" {
  value = lookup(var.instance_types, "dev", "t2.small")
}

Exemplo de merge()

A função merge() combina múltiplos mapas em um único mapa.

hcl

variable "map1" {
  description = "Primeiro mapa de configuração"
  type        = map(string)
  default     = {
    key1 = "value1"
    key2 = "value2"
  }
}

variable "map2" {
  description = "Segundo mapa de configuração"
  type        = map(string)
  default     = {
    key3 = "value3"
    key4 = "value4"
  }
}

output "merged_map" {
  value = merge(var.map1, var.map2)
}

Exemplo de keys() e values()

As funções keys() e values() retornam as chaves e valores de um mapa, respectivamente.

hcl

variable "instance_types" {
  description = "Tipos de instâncias para diferentes ambientes"
  type        = map(string)
  default     = {
    dev  = "t2.micro"
    prod = "m5.large"
  }
}

output "map_keys" {
  value = keys(var.instance_types)
}

output "map_values" {
  value = values(var.instance_types)
}

Uso de Mapas em Outputs

Mapas também podem ser usados em outputs para exibir coleções de pares chave-valor.
Exemplo de Output de Mapa

hcl

variable "tags" {
  description = "Tags para recursos"
  type        = map(string)
  default     = {
    Name        = "example-instance"
    Environment = "dev"
  }
}

output "resource_tags" {
  description = "Tags dos recursos"
  value       = var.tags
}

# Resumo

 - **Definição de Mapas**: Use chaves **{}** para definir mapas de pares chave-valor.
 - **Uso em Recursos**: Utilize mapas para configurar recursos de forma dinâmica com base em chaves específicas.
 - **Operações**: Utilize funções como **lookup()**, **merge()**, **keys()**, e **values()** para manipular mapas.
 - **Outputs**: Exiba coleções de pares chave-valor em outputs.

Mapas são extremamente úteis no Terraform para organizar e gerenciar configurações complexas de forma eficiente e flexível, permitindo que você adapte suas definições de infraestrutura a diferentes cenários e ambientes.