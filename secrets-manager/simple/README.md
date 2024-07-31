# Secrets Manager | Simple

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.46 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_secrets"></a> [secrets](#module\_secrets) | terraform-aws-modules/secrets-manager/aws | ~> 1.1 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_block_public_policy"></a> [block\_public\_policy](#input\_block\_public\_policy) | Whether to block public policy for the secret | `bool` | `false` | no |
| <a name="input_create_policy"></a> [create\_policy](#input\_create\_policy) | Whether to create a policy for the secret | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of the secret | `string` | `null` | no |
| <a name="input_env"></a> [env](#input\_env) | The environment to use | `string` | n/a | yes |
| <a name="input_ignore_secret_changes"></a> [ignore\_secret\_changes](#input\_ignore\_secret\_changes) | Whether to ignore secret changes | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the resource | `string` | n/a | yes |
| <a name="input_policy_statements"></a> [policy\_statements](#input\_policy\_statements) | A map of IAM policy [statements](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document#statement) for custom permission usage | `map(any)` | `{}` | no |
| <a name="input_region"></a> [region](#input\_region) | The AWS region to use | `string` | n/a | yes |
| <a name="input_secret_string"></a> [secret\_string](#input\_secret\_string) | The secret keys to use | `string` | `null` | no |
| <a name="input_system_tags"></a> [system\_tags](#input\_system\_tags) | System tags to use. Automatically populated by the terragrunt. | `map(string)` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags to use | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_secret"></a> [secret](#output\_secret) | The values of the secret |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
