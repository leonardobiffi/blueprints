# ECS | ECR

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.33 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ecr"></a> [ecr](#module\_ecr) | terraform-aws-modules/ecr/aws | ~> 2.2 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_env"></a> [env](#input\_env) | The environment to use | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the resource | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The AWS region to use | `string` | n/a | yes |
| <a name="input_repository_image_tag_mutability"></a> [repository\_image\_tag\_mutability](#input\_repository\_image\_tag\_mutability) | The image tag mutability setting for the repository | `string` | `"IMMUTABLE"` | no |
| <a name="input_repository_lifecycle_policy"></a> [repository\_lifecycle\_policy](#input\_repository\_lifecycle\_policy) | The lifecycle policy to apply to the repository | `any` | `null` | no |
| <a name="input_repository_policy"></a> [repository\_policy](#input\_repository\_policy) | The policy to apply to the repository | `string` | `null` | no |
| <a name="input_repository_type"></a> [repository\_type](#input\_repository\_type) | The type of repository to create. Either `public` or `private` | `string` | `"private"` | no |
| <a name="input_system_tags"></a> [system\_tags](#input\_system\_tags) | System tags to use. Automatically populated by the terragrunt. | `map(string)` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags to use | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | Full ARN of the repository |
| <a name="output_name"></a> [name](#output\_name) | Name of the repository |
| <a name="output_registry_id"></a> [registry\_id](#output\_registry\_id) | The registry ID where the repository was created |
| <a name="output_url"></a> [url](#output\_url) | The URL of the repository |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
