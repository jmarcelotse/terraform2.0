No HashiCorp Configuration Language (HCL), os blocos são a unidade básica de estrutura, e existem diferentes tipos de blocos usados para diversos propósitos. Cada tipo de bloco tem uma função específica na definição e gerenciamento da infraestrutura. Aqui estão os principais tipos de blocos usados no Terraform, que é uma das ferramentas mais populares que utiliza HCL:

1. **Bloco provider**

O bloco provider é usado para configurar os provedores de infraestrutura que o Terraform irá usar. Um provedor é responsável por gerenciar os recursos de um serviço específico (por exemplo, AWS, Azure, Google Cloud).

    provider "aws" {
        region = "us-west-2"
    }

2. **Bloco resource**

O bloco resource é utilizado para definir recursos que serão provisionados e gerenciados pelo Terraform. Cada recurso tem um tipo (por exemplo, aws_instance, google_compute_instance) e um nome local.

    resource "aws_instance" "example" {
        ami           = "ami-0c55b159cbfafe1f0"
        instance_type = "t2.micro"

        tags = {
            Name = "example-instance"
        }
    }

3. **Bloco variable**

O bloco variable é usado para definir variáveis de entrada que podem ser usadas para parametrizar a configuração do Terraform.

    variable "instance_type" {
        description = "Tipo da instância EC2"
        default     = "t2.micro"
    }

4. **Bloco output**

O bloco output é utilizado para definir valores de saída que serão mostrados quando o Terraform aplicar a configuração. Isso é útil para exibir informações importantes, como endereços IP ou IDs de recursos.

    output "instance_id" {
        value = aws_instance.example.id
    }

5. **Bloco locals**

O bloco locals é usado para definir variáveis locais, que são valores calculados que podem ser usados em outros blocos dentro da configuração.

6. **Bloco module**

O bloco module permite reutilizar código Terraform, agrupando recursos em módulos que podem ser referenciados e usados em diferentes configurações.

    module "vpc" {
        source = "./modules/vpc"
        cidr_block = "10.0.0.0/16"
    }

7. **Bloco terraform**

O bloco terraform é usado para configurar comportamentos gerais do Terraform, como o backend para armazenar o estado da infraestrutura.

    terraform {
        backend "s3" {
            bucket = "my-terraform-state"
            key    = "path/to/my/key"
            region = "us-west-2"
        }
    }

8. **Bloco data**

O bloco data é utilizado para definir fontes de dados que são usadas para buscar informações de fora do Terraform, como recursos existentes ou informações de provedores de serviços.

    data "aws_ami" "example" {
        most_recent = true

        filter {
            name   = "name"
            values = ["amzn-ami-hvm-*"]
        }

        filter {
            name   = "virtualization-type"
            values = ["hvm"]
        }

        owners = ["self"]
    }

9. **Bloco provisioner**

O bloco provisioner é usado para executar scripts ou comandos em recursos após sua criação ou destruição. Comum em recursos como instâncias de máquinas virtuais.

    resource "aws_instance" "example" {
        ami           = "ami-0c55b159cbfafe1f0"
        instance_type = "t2.micro"

        provisioner "local-exec" {
            command = "echo ${self.id} > instance_id.txt"
        }
    }

10. **Bloco provider**

Este bloco é utilizado para configurar provedores que permitem ao Terraform gerenciar recursos de infraestrutura em várias plataformas e serviços.

    provider "google" {
        credentials = file("account.json")
        project     = "my-project-id"
        region      = "us-central1"
    }

**Conclusão**

Os blocos HCL permitem uma definição clara e estruturada da infraestrutura, facilitando o gerenciamento de ambientes complexos. Compreender os diferentes tipos de blocos e suas funções é crucial para criar configurações eficientes e reutilizáveis no Terraform.

# Terraform settings

**Bloco terraform e Configurações no Terraform**

O bloco **terraform** é utilizado para configurar comportamentos gerais do Terraform e pode incluir várias subconfigurações para controlar diferentes aspectos do funcionamento da ferramenta. Essas configurações permitem gerenciar o backend de estado, módulos, provedores, etc.

**Estrutura do Bloco terraform**

Aqui está um exemplo básico de como o bloco **terraform** pode ser estruturado:

    terraform {
        backend "s3" {
            bucket = "my-terraform-state"
            key    = "path/to/my/key"
            region = "us-west-2"
        }

        required_version = ">= 1.0.0"

        required_providers {
            aws = {
                source  = "hashicorp/aws"
                version = ">= 3.0.0"
            }
        }

        experiments = [module_variable_optional_attrs]
    }

# Componentes do Bloco terraform

1. **Backend**

O backend define onde e como o estado do Terraform será armazenado. Isso é crucial para operações colaborativas e para manter a consistência do estado da infraestrutura.

Exemplo de configuração para backend S3:

    terraform {
        backend "s3" {
            bucket = "my-terraform-state"
            key    = "path/to/my/key"
            region = "us-west-2"
        }
    }

2. **Required Version**

Especifica a versão mínima do Terraform necessária para aplicar a configuração. Isso ajuda a garantir que todos os membros da equipe estejam usando uma versão compatível do Terraform.

    terraform {
        required_version = ">= 1.0.0"
    }

3. **Required Providers**

Define os provedores necessários para a configuração e suas versões. Isso garante que os provedores usados estejam disponíveis e na versão correta.

    terraform {
        required_providers {
            aws = {
                source  = "hashicorp/aws"
                version = ">= 3.0.0"
            }
        }
    }

4. **Experiments**

O campo experiments é utilizado para habilitar funcionalidades experimentais que ainda não estão oficialmente estáveis.

    terraform {
        experiments = [module_variable_optional_attrs]
    }

5. **Module**

A seção module dentro do bloco terraform pode ser usada para configurar comportamento relacionado aos módulos, embora seu uso específico seja raro dentro do bloco terraform. Mais frequentemente, os módulos são definidos fora deste bloco.

    terraform {
        backend "s3" {
            bucket = "my-terraform-state"
            key    = "path/to/my/key"
            region = "us-west-2"
        }

    required_version = ">= 1.0.0"

    required_providers {
            aws = {
                source  = "hashicorp/aws"
                version = ">= 3.0.0"
            }
    }

        experiments = [module_variable_optional_attrs]
    }

    provider "aws" {
        region = "us-west-2"
    }

    resource "aws_instance" "example" {
        ami           = "ami-0c55b159cbfafe1f0"
        instance_type = "t2.micro"

    tags = {
        Name = "example-instance"
        }
    }

# Conclusão

O bloco terraform é fundamental para configurar comportamentos gerais do Terraform, incluindo a definição do backend para armazenamento de estado, especificação de versões necessárias do Terraform e de provedores, além de habilitação de recursos experimentais. Compreender e utilizar corretamente essas configurações é essencial para gerenciar a infraestrutura de maneira eficiente e colaborativa.

    terraform{
        required_version = ">1.0"
        required_providers {
            digitalocean = {
                source = "digitalocean/digitalocean"
                version = "2.16.0"
            }
        }
    }

# Providers no Terraform

**Providers** no Terraform são plugins que permitem ao Terraform interagir com APIs de serviços externos. Eles são responsáveis por entender os recursos disponíveis e as operações que podem ser executadas em uma plataforma específica, como AWS, Azure, Google Cloud, Kubernetes, entre outros. Cada provider gerencia um conjunto de recursos, oferecendo a capacidade de criar, ler, atualizar e excluir esses recursos.

# Estrutura Básica de um Provider

Para utilizar um provider, é necessário declará-lo no arquivo de configuração do Terraform. A configuração básica de um provider inclui o tipo do provider e, geralmente, informações de autenticação e configuração regional.

**Exemplo de Configuração de um Provider**

Aqui está um exemplo de configuração de um provider para AWS:

    provider "aws" {
        region  = "us-west-2"
        profile = "default"
    }

Neste exemplo, estamos configurando o provider AWS, especificando a região **us-west-2** e usando o perfil de credenciais **default**.

# Componentes de uma Configuração de Provider

1. **Tipo do Provider**

O tipo do provider é o identificador que especifica qual provider será utilizado. No exemplo acima, o tipo do provider é **aws**.

2. **Configurações de Autenticação**

As configurações de autenticação variam entre os providers e podem incluir informações como chaves de acesso, perfis, tokens e outros métodos de autenticação necessários para acessar a API do serviço.

    provider "aws" {
        access_key = "your-access-key"
        secret_key = "your-secret-key"
        region     = "us-west-2"
    }

3. **Configurações Regionais**

Muitos providers, especialmente os de nuvem, exigem a especificação de uma região para criar e gerenciar recursos.

    provider "aws" {
        region = "us-west-2"
    }

4. **Versão do Provider**

É possível especificar a versão do provider para garantir compatibilidade e evitar mudanças inesperadas que possam ocorrer em atualizações de versões.

    terraform {
        required_providers {
            aws = {
                source  = "hashicorp/aws"
                version = "~> 3.0"
            }
        }
    }

# Uso de Múltiplos Providers

Em alguns casos, pode ser necessário usar múltiplos providers, seja para acessar diferentes contas na mesma plataforma ou diferentes plataformas de nuvem. Isso pode ser feito declarando múltiplos blocos de provider com aliases.

    provider "aws" {
        alias  = "primary"
        region = "us-west-2"
    }

    provider "aws" {
        alias  = "secondary"
        region = "us-east-1"
    }

    resource "aws_instance" "primary_instance" {
        provider = aws.primary
        ami      = "ami-0c55b159cbfafe1f0"
        instance_type = "t2.micro"
    }

    resource "aws_instance" "secondary_instance" {
        provider = aws.secondary
        ami      = "ami-0c55b159cbfafe1f0"
        instance_type = "t2.micro"
    }

# Provedores Comuns

Aqui estão alguns exemplos de providers comumente usados no Terraform:

**AWS (Amazon Web Services)**

    provider "aws" {
        region = "us-west-2"
    }

**Azure (Microsoft Azure)**

    provider "azurerm" {
        features {}
    }

**Google Cloud Platform (GCP)**

    provider "google" {
        credentials = file("account.json")
        project     = "my-project-id"
        region      = "us-central1"
    }

**Kubernetes**

    provider "kubernetes" {
        config_path = "~/.kube/config"
    }

# Listagem e Busca de Providers

Terraform oferece um vasto ecossistema de providers. A maioria dos providers oficiais e da comunidade pode ser encontrada no ***Terraform Registry***. No registro, você pode pesquisar providers, visualizar suas documentações, exemplos de uso e versões disponíveis.

# Conclusão

Providers são um componente essencial no Terraform, permitindo que ele se integre com diversas plataformas e serviços. A configuração correta dos providers é fundamental para o sucesso na automação e gerenciamento da infraestrutura. Compreender como configurar e utilizar providers permite que os usuários do Terraform criem infraestruturas complexas e multi-plataforma de forma eficiente e escalável.

    provider "digitalicean"{
        toke=""
    }

# Resources no Terraform

**Resources** no Terraform são blocos fundamentais que representam componentes individuais de sua infraestrutura. Eles são os blocos de construção usados para definir e gerenciar recursos como instâncias de máquinas virtuais, buckets de armazenamento, bancos de dados, e muitos outros tipos de infraestrutura.

# Estrutura de um Bloco Resource

Cada resource tem uma estrutura específica que inclui o tipo do recurso, um nome local, e uma série de parâmetros que definem as propriedades do recurso.

**Exemplo de Bloco Resource**

Aqui está um exemplo básico de um recurso no Terraform para criar uma instância EC2 na AWS:

    resource "aws_instance" "example" {
        ami           = "ami-0c55b159cbfafe1f0"
        instance_type = "t2.micro"

        tags = {
            Name = "example-instance"
        }
    }

Neste exemplo:

- **aws_instance** é o tipo do recurso, indicando que estamos criando uma instância EC2 na AWS.

- **example** é o nome local do recurso, que é usado para referenciar este recurso em outras partes da configuração.

- Os parâmetros **ami** e **instance_type** definem a AMI a ser usada e o tipo da instância.

- O bloco **tags** define tags associadas à instância.

# Componentes do Bloco Resource

1. Tipo do Recurso

O tipo do recurso especifica o tipo de infraestrutura que você está criando. Isso é prefixado pelo provedor. No exemplo, **aws_instance** indica uma instância EC2 da AWS.

2. Nome Local

O nome local é um identificador arbitrário usado para referenciar o recurso dentro da configuração do Terraform. Deve ser único dentro do arquivo.

3. Parâmetros

Os parâmetros são as configurações específicas para o recurso. Eles variam dependendo do tipo do recurso e podem incluir strings, números, listas, mapas e blocos aninhados.

# Atributos e Argumentos

**Argumentos**

Os argumentos são configurações que você define para o recurso. Eles especificam os detalhes de como o recurso deve ser configurado.

    resource "aws_instance" "example" {
        ami           = "ami-0c55b159cbfafe1f0"
        instance_type = "t2.micro"
    }

**Atributos**

Os atributos são informações sobre o recurso que podem ser lidas depois que o recurso é criado. Alguns atributos são exportados automaticamente pelo Terraform e podem ser usados para referenciar propriedades do recurso em outras partes da configuração.

    output "instance_id" {
        value = aws_instance.example.id
    }

# Métodos de Interpolação

Terraform permite a interpolação de variáveis e atributos de recursos para criar dependências e vincular recursos.

    resource "aws_instance" "example" {
        ami           = "ami-0c55b159cbfafe1f0"
        instance_type = "t2.micro"
        subnet_id     = aws_subnet.example.id

        tags = {
            Name = "example-instance"
        }
    }

Neste exemplo, **subnet_id** é configurado usando o **id** de um recurso **aws_subnet** definido em outro lugar na configuração.

# Métodos de Ciclo de Vida

Você pode controlar o ciclo de vida dos recursos usando o bloco **lifecycle**.

    resource "aws_instance" "example" {
        ami           = "ami-0c55b159cbfafe1f0"
        instance_type = "t2.micro"

        lifecycle {
            create_before_destroy = true
        }
    }

**Configurações Comuns de Ciclo de Vida**

- **create_before_destroy**: Garante que o novo recurso seja criado antes do antigo ser destruído.

- **prevent_destroy**: Impede a destruição do recurso, evitando mudanças acidentais.

- **ignore_changes**: Ignora mudanças em atributos especificados, útil para propriedades que podem ser alteradas fora do Terraform.

# Dependent Resources
Os recursos no Terraform podem ter dependências explícitas ou implícitas em outros recursos.

**Dependências Explícitas**

Você pode definir dependências explícitas usando o parâmetro **depends_on**.

    resource "aws_instance" "example" {
        ami           = "ami-0c55b159cbfafe1f0"
        instance_type = "t2.micro"
        depends_on    = [aws_vpc.example]
    }

**Dependências Implícitas**

As dependências implícitas são criadas automaticamente pelo Terraform quando um recurso refere-se a outro.

    resource "aws_instance" "example" {
        ami           = "ami-0c55b159cbfafe1f0"
        instance_type = "t2.micro"
        subnet_id     = aws_subnet.example.id
    }

# Conclusão

Os recursos são componentes centrais no Terraform, representando os elementos individuais da infraestrutura que você gerencia. Entender como configurar e utilizar recursos eficazmente é crucial para construir e manter infraestruturas de maneira eficiente e segura. Com a capacidade de definir dependências, interpolar valores e controlar o ciclo de vida, o Terraform oferece uma abordagem poderosa e flexível para a automação da infraestrutura.

    resource "digitalocean_droplet" "maquina_labs_tf"{
        image = "ubuntu-20-04-x64"
        name = "maquina-labs-tf"
        region = "nyc1"
        size = "s-1vcpu-2bg"
    }

# Data Sources no Terraform

**Data Sources** no Terraform são usados para obter informações de recursos ou serviços externos. Eles permitem que você consulte dados existentes fora do Terraform, que podem ser utilizados na sua configuração. Isso é particularmente útil quando você precisa de informações sobre recursos que não são gerenciados pelo Terraform ou que são criados fora do escopo da configuração atual.

# Estrutura de um Bloco Data Source

Cada data source tem uma estrutura específica que inclui o tipo do data source, um nome local, e uma série de parâmetros que definem as condições para buscar os dados.

**Exemplo de Bloco Data Source**

Aqui está um exemplo básico de um data source no Terraform para obter informações sobre uma AMI (Amazon Machine Image) na AWS:

    data "aws_ami" "example" {
        most_recent = true

        filter {
            name   = "name"
            values = ["amzn-ami-hvm-*"]
        }

        filter {
            name   = "virtualization-type"
            values = ["hvm"]
        }

        owners = ["self"]
    }

Neste exemplo:

- **aws_ami** é o tipo do data source, indicando que estamos obtendo informações sobre uma AMI da AWS.

- **example** é o nome local do data source, que é usado para referenciar os dados obtidos em outras partes da configuração.

- Os parâmetros **most_recent**, **filter** e **owners** definem as condições de busca da AMI.

# Componentes do Bloco Data Source

1. **Tipo do Data Source**

O tipo do data source especifica qual serviço ou recurso será consultado. No exemplo acima, aws_ami indica que estamos buscando informações sobre AMIs na AWS.

2. **Nome Local**

O nome local é um identificador arbitrário usado para referenciar o data source dentro da configuração do Terraform. Deve ser único dentro do arquivo.

3. **Parâmetros**

Os parâmetros são as condições específicas usadas para buscar os dados. Eles variam dependendo do tipo do data source e podem incluir filtros, IDs, nomes, entre outros critérios.

# Uso de Data Sources

Os data sources são frequentemente usados em conjunto com recursos para configurar recursos com base em informações existentes. Por exemplo, você pode usar um data source para obter a ID de uma AMI e depois usar essa ID para criar uma instância EC2.

# Exemplo Completo

Aqui está um exemplo completo que utiliza um data source para obter a ID de uma AMI e usá-la para criar uma instância EC2:

    # Data Source para obter a AMI mais recente
    data "aws_ami" "example" {
        most_recent = true

        filter {
            name   = "name"
            values = ["amzn-ami-hvm-*"]
        }

        filter {
            name   = "virtualization-type"
            values = ["hvm"]
        }

        owners = ["self"]
    }

    # Recurso que utiliza a AMI obtida pelo Data Source
    resource "aws_instance" "example" {
        ami           = data.aws_ami.example.id
        instance_type = "t2.micro"

        tags = {
            Name = "example-instance"
        }
    }

# Componentes Adicionais

**Interpolação de Valores**

Você pode interpolar valores obtidos de data sources em outros blocos, como recursos, outputs, ou variáveis.

    output "ami_id" {
        value = data.aws_ami.example.id
    }

**Filtros e Condições**

Os filtros e condições permitem restringir os resultados obtidos pelo data source. Isso garante que você obtenha exatamente as informações necessárias.

    data "aws_ami" "example" {
        most_recent = true

        filter {
            name   = "name"
            values = ["amzn-ami-hvm-*"]
        }

        filter {
            name   = "virtualization-type"
            values = ["hvm"]
        }

        owners = ["self"]
    }

# Benefícios dos Data Sources

- **Reutilização de Recursos Existentes**: Permitem utilizar informações de recursos existentes, evitando a duplicação e facilitando a integração com infraestrutura já existente.

- **Atualizações Dinâmicas**: As informações obtidas dos data sources são dinâmicas, garantindo que você sempre obtenha os dados mais atualizados conforme definido nos filtros e condições.

- **Redução de Código Duplicado**: Centraliza a obtenção de informações, reduzindo a necessidade de definir repetidamente os mesmos parâmetros em diferentes partes da configuração.

# Conclusão
Os data sources são uma ferramenta poderosa no Terraform para integrar dados externos na configuração de infraestrutura. Eles permitem obter informações atualizadas sobre recursos existentes e utilizá-las de maneira eficiente e flexível. Entender e utilizar data sources adequadamente pode melhorar significativamente a capacidade de gerenciar e integrar infraestruturas complexas com o Terraform.#

    data "digitalocean_ssh_key""minha_chave"{
        name="aula"
    }

# Variables no Terraform

As **variáveis** no Terraform são utilizadas para tornar as configurações mais dinâmicas e reutilizáveis. Elas permitem a parametrização dos arquivos de configuração, facilitando a personalização e a flexibilidade sem a necessidade de modificar diretamente o código do Terraform.

# Tipos de Variáveis

Existem três tipos principais de variáveis no Terraform:

1. **Input Variables**: Para definir valores que podem ser passados para a configuração do Terraform.

2. **Local Values (Locals)**: Para definir valores reutilizáveis dentro do mesmo módulo.

3. **Output Values**: Para exportar valores após a execução do Terraform.

# Input Variables

As Input Variables são usadas para parametrizar a configuração do Terraform, permitindo a entrada de valores dinâmicos. Elas são definidas usando o bloco variable.

**Exemplo de Definição de Variável**

    variable "instance_type" {
        description = "Tipo da instância EC2"
        type        = string
        default     = "t2.micro"
    }

Neste exemplo:

- **instance_type** é o nome da variável.

- **description** é uma descrição opcional que explica o propósito da variável.

- **type** define o tipo de dado da variável (string, number, bool, list, map, etc.).

- **default** é o valor padrão da variável.

# Usando Variáveis

As variáveis são referenciadas usando a sintaxe **${var.nome_da_variavel}** ou a notação curta **var.nome_da_variavel**.

    resource "aws_instance" "example" {
        ami           = "ami-0c55b159cbfafe1f0"
        instance_type = var.instance_type
    }

# Tipos de Dados das Variáveis

1. **String**: Um valor de texto.

2. **Number**: Um valor numérico.

3. **Bool**: Um valor booleano (true ou false).

4. **List**: Uma lista de valores.

5. **Map**: Um mapa de chave-valor.

6. **Object**: Um objeto complexo com múltiplos atributos.

7. **Tuple**: Uma lista de valores heterogêneos.

**Exemplo de Variáveis de Diferentes Tipos**

    variable "image_id" {
        type = string
    }

    variable "instance_count" {
        type = number
    }

    variable "enable_monitoring" {
        type = bool
    }

    variable "instance_types" {
        type = list(string)
    }

    variable "tags" {
        type = map(string)
    }

    variable "database" {
        type = object({
            engine  = string
            version = string
        })
    }

    variable "settings" {
        type = tuple([string, number, bool])
    }

# Fornecendo Valores para Variáveis

Há várias maneiras de fornecer valores para as variáveis:

1. **Arquivo terraform.tfvars**: Um arquivo de valores de variáveis.

    instance_type = "t3.medium"

2. **Arquivo .auto.tfvars**: Arquivos automaticamente carregados pelo Terraform.

    custom.auto.tfvars

3. **Linha de Comando**: Usando a opção -var.

    terraform apply -var="instance_type=t3.medium"

4. **Variáveis de Ambiente**: Prefixadas com **TF_VAR_**.

    export TF_VAR_instance_type="t3.medium"

5. **Bloco variable Defaults**: Usando valores padrão no próprio bloco variable.

# Local Values (Locals)

**Local Values** são valores definidos localmente dentro de um módulo para evitar repetição e simplificar a configuração.

**Exemplo de Definição de Locais**

    locals {
        common_tags = {
            environment = "production"
            team        = "devops"
        }
    }

    resource "aws_instance" "example" {
        ami           = "ami-0c55b159cbfafe1f0"
        instance_type = "t2.micro"

        tags = local.common_tags
    }

# Output Values

**Output Values** são usados para exportar valores após a execução do Terraform, permitindo que outros módulos ou a própria equipe visualizem informações úteis sobre a infraestrutura provisionada.

**Exemplo de Definição de Outputs**

    output "instance_id" {
        value = aws_instance.example.id
    }

    output "instance_public_ip" {
        value = aws_instance.example.public_ip
    }

# Conclusão

As variáveis no Terraform são essenciais para criar configurações flexíveis, reutilizáveis e modulares. Com a capacidade de parametrizar a infraestrutura, definir valores locais reutilizáveis e exportar informações úteis, as variáveis tornam o gerenciamento da infraestrutura mais eficiente e dinâmico.

    variable "regiao" {
        type = string
        default = "nyc1"
        description = "Regiao de uso na Digital Ocean"
    }

# Outputs no Terraform

Os **Outputs** no Terraform são usados para exportar valores do seu código de infraestrutura, tornando esses valores acessíveis após a execução de um plano (**apply**). Eles são especialmente úteis para expor informações importantes que você pode precisar usar posteriormente, como IDs de recursos, endereços IP, URLs, etc.

# Definição de Outputs

Outputs são definidos usando o bloco output. Cada output tem um nome e um valor associado, que é calculado com base nos recursos ou outras expressões.

**Estrutura de um Bloco Output**

Aqui está um exemplo básico de como definir um output:

    output "instance_id" {
        value = aws_instance.example.id
    }

Neste exemplo:

- **instance_id** é o nome do output.

- **value** é a expressão que define o valor do output, neste caso, a ID de uma instância EC2 criada anteriormente.

# Atributos de Outputs

1. **value**

O atributo value é obrigatório e define o valor a ser exportado. Esse valor pode ser uma referência a um recurso, uma variável, uma expressão ou uma combinação deles.

    output "instance_public_ip" {
        value = aws_instance.example.public_ip
    }

2. **description**

O atributo **description** é opcional e permite adicionar uma descrição que explica o propósito do output.

    output "instance_public_ip" {
        value       = aws_instance.example.public_ip
        description = "O endereço IP público da instância EC2"
    }

3. **sensitive**

O atributo **sensitive** é opcional e, quando definido como true, oculta o valor do output nos logs do Terraform, útil para informações sensíveis como senhas e tokens.

    output "db_password" {
        value     = aws_db_instance.example.password
        sensitive = true
    }

# Utilização de Outputs

Outputs podem ser utilizados de diversas maneiras:

1. **Exibição no Terminal**: Após a execução do terraform apply, os valores dos outputs são exibidos no terminal.

2. **Referência em Outros Módulos**: Outputs de um módulo podem ser referenciados em outro módulo, facilitando a comunicação entre diferentes partes da infraestrutura.

3. **Integração com Scripts ou Ferramentas Externas**: Outputs podem ser utilizados por scripts ou ferramentas externas que executam comandos Terraform para capturar valores necessários para operações subsequentes.

**Exemplo de Uso de Outputs em Módulos**

Suponha que temos um módulo chamado network que cria uma VPC. Podemos definir um output para exportar a ID da VPC:

    # Módulo network (modules/network/outputs.tf)
    output "vpc_id" {
        value = aws_vpc.main.id
    }

E então podemos utilizar esse output em outro módulo ou na configuração principal:

    module "network" {
        source = "./modules/network"
    }

    resource "aws_subnet" "main" {
        vpc_id = module.network.vpc_id
        cidr_block = "10.0.1.0/24"
    }

# Output de Vários Valores

Você pode definir outputs que retornam listas ou mapas de valores. Isso é útil quando você deseja exportar coleções de informações.

**Exemplo de Output de Lista**

    output "instance_ids" {
        value = aws_instance.example.*.id
    }

Neste exemplo, **aws_instance.example.*.id** retorna uma lista de IDs de todas as instâncias criadas pelo recurso aws_instance.example.

**Exemplo de Output de Mapa**

    output "instance_ips" {
        value = { for instance in aws_instance.example : instance.id => instance.public_ip }
    }

Neste exemplo, estamos criando um mapa onde a chave é a ID da instância e o valor é o endereço IP público da instância.

# Conclusão

Outputs são uma parte essencial do Terraform para extrair e compartilhar informações importantes sobre os recursos gerenciados. Eles facilitam a integração entre módulos e com ferramentas externas, fornecendo uma maneira estruturada de expor e consumir dados de configuração. Usar outputs de maneira eficaz pode simplificar muito a gestão e automação da infraestrutura.

    output "droplet_ip" {
        value = digitalocean_droplet.maquina_labs_tf.ipv4_address
    }