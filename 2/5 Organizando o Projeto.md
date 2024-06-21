# Organizando o Projeto

1. Separar cada recurso.

/home/jmarcelotse/tse/terraform2.0
│
├── /2
│   ├── /5.1
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   ├── providers.tf
│   │   ├── terraform.tfvars
│   │   └── /modules
│   │       ├── /network
│   │       │   ├── main.tf
│   │       │   ├── variables.tf
│   │       │   └── outputs.tf
│   │       ├── /compute
│   │       │   ├── main.tf
│   │       │   ├── variables.tf
│   │       │   └── outputs.tf
│   │       └── /storage
│   │           ├── main.tf
│   │           ├── variables.tf
│   │           └── outputs.tf
│   └── /other-directories
└── /other-files