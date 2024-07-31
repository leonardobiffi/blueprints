# Cloudfront | Cache Policy

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

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudfront_origin_request_policy.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_origin_request_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_comment"></a> [comment](#input\_comment) | A comment to describe the cache policy | `string` | `"Managed by Terraform"` | no |
| <a name="input_cookies_config"></a> [cookies\_config](#input\_cookies\_config) | The cookies to forward to the origin | <pre>object({<br>    cookie_behavior = optional(string, "none")<br>    items           = optional(list(string))<br>  })</pre> | `null` | no |
| <a name="input_env"></a> [env](#input\_env) | The environment to use | `string` | n/a | yes |
| <a name="input_headers_config"></a> [headers\_config](#input\_headers\_config) | The headers to forward to the origin | <pre>object({<br>    header_behavior = optional(string, "none")<br>    items           = optional(list(string))<br>  })</pre> | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the SNS topic to create | `string` | n/a | yes |
| <a name="input_query_strings_config"></a> [query\_strings\_config](#input\_query\_strings\_config) | The query strings to forward to the origin | <pre>object({<br>    query_string_behavior = optional(string, "none")<br>    items                 = optional(list(string))<br>  })</pre> | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | The AWS region to use | `string` | n/a | yes |
| <a name="input_system_tags"></a> [system\_tags](#input\_system\_tags) | System tags to use. Automatically populated by the terragrunt. | `map(string)` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the origin request policy |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
