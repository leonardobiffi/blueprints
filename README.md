# Terraform Stacks

Repository do group modules of Terraform by context

## Structure

Which service have their own directory, with each stack separated by context.
Ex.: 
- Service: rds
- Stacks:
  - aurora
  - simple

```bash
rds
├── aurora
│   ├── README.md
│   ├── example
│   │   └── main.tf
│   ├── main.tf
│   ├── outputs.tf
│   ├── variables.tf
│   └── versions.tf
└── simple
    ├── README.md
    ├── main.tf
    ├── variables.tf
    ├── versions.tf
    └── vpc.tf
```

## Tools

- [terraform](https://developer.hashicorp.com/terraform/install) or [opentofu](https://opentofu.org/docs/intro/install)
- [terragrunt](https://terragrunt.gruntwork.io/docs/getting-started/install)
- [pre-commit](https://pre-commit.com/#install)
- [terraform-docs](https://terraform-docs.io/user-guide/installation)

### Installing All With [asdf](https://asdf-vm.com)

```
asdf plugin add <tool>
asdf install <tool> latest
asdf global <tool> latest
```
