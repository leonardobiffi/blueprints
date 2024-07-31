# EFS | Simple

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
| <a name="module_efs"></a> [efs](#module\_efs) | terraform-aws-modules/efs/aws | ~> 1.6 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_points"></a> [access\_points](#input\_access\_points) | A map of access point definitions to create | `any` | `{}` | no |
| <a name="input_env"></a> [env](#input\_env) | The environment to use | `string` | n/a | yes |
| <a name="input_lifecycle_policy"></a> [lifecycle\_policy](#input\_lifecycle\_policy) | The lifecycle policy for the EFS file system | `map(string)` | `{}` | no |
| <a name="input_mount_targets"></a> [mount\_targets](#input\_mount\_targets) | The mount targets for the EFS file system | `any` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the resource | `string` | n/a | yes |
| <a name="input_policy_statements"></a> [policy\_statements](#input\_policy\_statements) | A list of IAM policy [statements](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document#statement) for custom permission usage | `any` | `[]` | no |
| <a name="input_region"></a> [region](#input\_region) | The AWS region to use | `string` | n/a | yes |
| <a name="input_security_group_rules"></a> [security\_group\_rules](#input\_security\_group\_rules) | Map of security group rule definitions to create | `any` | `{}` | no |
| <a name="input_system_tags"></a> [system\_tags](#input\_system\_tags) | System tags to use. Automatically populated by the terragrunt. | `map(string)` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags to use | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The VPC ID to use | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_access_points"></a> [access\_points](#output\_access\_points) | Map of access points created and their attributes |
| <a name="output_arn"></a> [arn](#output\_arn) | Amazon Resource Name of the file system |
| <a name="output_dns_name"></a> [dns\_name](#output\_dns\_name) | The DNS name for the filesystem per [documented convention](http://docs.aws.amazon.com/efs/latest/ug/mounting-fs-mount-cmd-dns-name.html) |
| <a name="output_id"></a> [id](#output\_id) | The ID that identifies the file system (e.g., `fs-ccfc0d65`) |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
