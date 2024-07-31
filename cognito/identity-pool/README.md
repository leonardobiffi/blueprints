# Cognito | Identity Pool

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.9 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.60.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cognito_identity_pool.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_identity_pool) | resource |
| [aws_cognito_identity_pool_roles_attachment.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_identity_pool_roles_attachment) | resource |
| [aws_iam_role.authenticated](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.authenticated](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_policy_document.authenticated](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.authenticated_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_classic_flow"></a> [allow\_classic\_flow](#input\_allow\_classic\_flow) | Whether to allow classic flow | `bool` | `false` | no |
| <a name="input_allow_unauthenticated_identities"></a> [allow\_unauthenticated\_identities](#input\_allow\_unauthenticated\_identities) | Whether to allow unauthenticated identities | `bool` | `false` | no |
| <a name="input_cognito_identity_providers"></a> [cognito\_identity\_providers](#input\_cognito\_identity\_providers) | The list of Cognito Identity Providers | <pre>list(object({<br>    client_id               = string<br>    provider_name           = string<br>    server_side_token_check = bool<br>  }))</pre> | `[]` | no |
| <a name="input_env"></a> [env](#input\_env) | The environment to use | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the resource | `string` | n/a | yes |
| <a name="input_openid_connect_provider_arns"></a> [openid\_connect\_provider\_arns](#input\_openid\_connect\_provider\_arns) | The list of OpenID Connect provider ARNs | `list(string)` | `[]` | no |
| <a name="input_region"></a> [region](#input\_region) | The AWS region to use | `string` | n/a | yes |
| <a name="input_role_mapping"></a> [role\_mapping](#input\_role\_mapping) | The list of role mapping to use | <pre>list(object({<br>    ambiguous_role_resolution = string<br>    identity_provider         = string<br>    type                      = string<br>  }))</pre> | `[]` | no |
| <a name="input_roles"></a> [roles](#input\_roles) | The roles to use | <pre>object({<br>    authenticated   = optional(bool, false)<br>    unauthenticated = optional(bool, false)<br>  })</pre> | `{}` | no |
| <a name="input_saml_provider_arns"></a> [saml\_provider\_arns](#input\_saml\_provider\_arns) | The list of SAML provider ARNs | `list(string)` | `[]` | no |
| <a name="input_supported_login_providers"></a> [supported\_login\_providers](#input\_supported\_login\_providers) | The list of supported login providers | `map(string)` | `{}` | no |
| <a name="input_system_tags"></a> [system\_tags](#input\_system\_tags) | System tags to use. Automatically populated by the terragrunt. | `map(string)` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags to use | `map(string)` | `{}` | no |
| <a name="input_user_pool_arns"></a> [user\_pool\_arns](#input\_user\_pool\_arns) | The list of user pool ARNs | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the identity pool |
| <a name="output_id"></a> [id](#output\_id) | The ID of the identity pool |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
