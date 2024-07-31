# IAM | User

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.46 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.60.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_iam_user"></a> [iam\_user](#module\_iam\_user) | terraform-aws-modules/iam/aws//modules/iam-user | ~> 5.33 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_user_group_membership.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_group_membership) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_env"></a> [env](#input\_env) | The environment to use | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The AWS region to use | `string` | n/a | yes |
| <a name="input_system_tags"></a> [system\_tags](#input\_system\_tags) | System tags to use. Automatically populated by the terragrunt. | `map(string)` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |
| <a name="input_users"></a> [users](#input\_users) | A list of users to create | <pre>map(object({<br>    create_iam_user_login_profile = bool<br>    create_iam_access_key         = optional(bool, false)<br>    policy_arns                   = optional(list(string), [])<br>    groups                        = optional(list(string), [])<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_iam_users"></a> [iam\_users](#output\_iam\_users) | The user's name |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
