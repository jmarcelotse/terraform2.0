# Boolean

No Terraform, um boolean é um tipo de dado que representa valores lógicos, podendo ser **true** ou **false**. Booleans são úteis para controle condicional na configuração de recursos e para ativar ou desativar certas funcionalidades com base em variáveis de entrada.

# Definindo Booleans

Booleans são definidos diretamente como **true** ou **false** nas variáveis, recursos e outputs. Aqui está um exemplo de como definir e usar booleans no Terraform.

**Exemplo de Variável Booleana**

    hcl

    variable "enable_monitoring" {
    description = "Habilitar monitoramento"
    type        = bool
    default     = false
    }

# Usando Booleans em Recursos

Você pode usar variáveis booleanas para controlar a configuração dos recursos. Aqui está um exemplo onde uma variável booleana determina se o monitoramento detalhado deve ser habilitado para uma instância do AWS EC2:

    hcl
    resource "aws_instance" "example" {
    ami           = "ami-12345678"
    instance_type = "t2.micro"
    monitoring    = var.enable_monitoring
    }

Operadores Lógicos

Terraform permite o uso de operadores lógicos com booleans, tais como **&&** (AND), **||** (OR) e **!** (NOT).


Exemplo de Operadores Lógicos

    hcl

    variable "condition1" {
    description = "Condição 1"
    type        = bool
    default     = true
    }

    variable "condition2" {
    description = "Condição 2"
    type        = bool
    default     = false
    }

    output "and_result" {
    value = var.condition1 && var.condition2
    }

    output "or_result" {
    value = var.condition1 || var.condition2
    }

    output "not_result" {
    value = !var.condition1
    }

# Funções Condicionais

Terraform oferece funções condicionais para tomar decisões com base em valores booleanos.

**Exemplo de Função Condicional**

A função **count** é frequentemente usada em combinação com booleans para criar ou não recursos com base em uma condição:

    hcl
    variable "create_instance" {
    description = "Criar instância"
    type        = bool
    default     = true
    }

    resource "aws_instance" "example" {
    count         = var.create_instance ? 1 : 0
    ami           = "ami-12345678"
    instance_type = "t2.micro"
    }

Neste exemplo, a instância só será criada se **var.create_instance** for **true**.

# Uso de Booleans em Outputs

Booleans também podem ser usados em outputs para exibir informações de configuração lógica.

**Exemplo de Output Booleano**

    hcl

    variable "enable_feature" {
    description = "Habilitar funcionalidade"
    type        = bool
    default     = true
    }

    output "feature_status" {
    description = "Status da funcionalidade"
    value       = var.enable_feature
    }

# Resumo

 - **Definição de Variáveis**: Use o tipo bool para definir variáveis booleanas.
 - **Uso em Recursos**: Controle a configuração dos recursos com variáveis booleanas.
 - **Operadores Lógicos**: Use **&&**, **||** e **!** para operações lógicas.
 - **Funções Condicionais**: Utilize condicionais para tomar decisões baseadas em booleans.
 - **Outputs**: Exiba informações booleanas em outputs.

Booleans são extremamente úteis no Terraform para criar configurações flexíveis e condicionalmente ativar ou desativar partes da infraestrutura, aumentando a modularidade e reutilização das definições de infraestrutura.
