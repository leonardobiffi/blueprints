# WAF | WebACL

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
| <a name="module_waf"></a> [waf](#module\_waf) | umotif-public/waf-webaclv2/aws | ~> 5.1 |

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_wafv2_web_acl_logging_configuration.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/wafv2_web_acl_logging_configuration) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb_arn"></a> [alb\_arn](#input\_alb\_arn) | The ARN of the ALB to associate the WAF with | `string` | `null` | no |
| <a name="input_allow_default_action"></a> [allow\_default\_action](#input\_allow\_default\_action) | Whether to allow the default action | `bool` | `true` | no |
| <a name="input_cloudwatch_log_retention_days"></a> [cloudwatch\_log\_retention\_days](#input\_cloudwatch\_log\_retention\_days) | The number of days to retain the logs in CloudWatch | `number` | `7` | no |
| <a name="input_create_logging_configuration"></a> [create\_logging\_configuration](#input\_create\_logging\_configuration) | Whether to create a logging configuration | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of the WAF | `string` | `""` | no |
| <a name="input_env"></a> [env](#input\_env) | The environment to use | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the resource | `string` | n/a | yes |
| <a name="input_redacted_fields"></a> [redacted\_fields](#input\_redacted\_fields) | The parts of the request that you want to keep out of the logs.<br>You can only specify one of the following: `method`, `query_string`, `single_header`, or `uri_path`<br><br>method:<br>  Whether to enable redaction of the HTTP method.<br>  The method indicates the type of operation that the request is asking the origin to perform.<br>uri\_path:<br>  Whether to enable redaction of the URI path.<br>  This is the part of a web request that identifies a resource.<br>query\_string:<br>  Whether to enable redaction of the query string.<br>  This is the part of a URL that appears after a `?` character, if any.<br>single\_header:<br>  The list of names of the query headers to redact. | <pre>map(object({<br>    method        = optional(bool, false)<br>    uri_path      = optional(bool, false)<br>    query_string  = optional(bool, false)<br>    single_header = optional(list(string), null)<br>  }))</pre> | <pre>{<br>  "method": {<br>    "method": true<br>  },<br>  "query_string": {<br>    "query_string": true<br>  },<br>  "uri_path": {<br>    "uri_path": true<br>  }<br>}</pre> | no |
| <a name="input_region"></a> [region](#input\_region) | The AWS region to use | `string` | n/a | yes |
| <a name="input_rules"></a> [rules](#input\_rules) | The rules to use | `any` | `[]` | no |
| <a name="input_scope"></a> [scope](#input\_scope) | The scope of the WAF | `string` | `"REGIONAL"` | no |
| <a name="input_system_tags"></a> [system\_tags](#input\_system\_tags) | System tags to use. Automatically populated by the terragrunt. | `map(string)` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags to use | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_web_acl_arn"></a> [web\_acl\_arn](#output\_web\_acl\_arn) | The ARN of the WAF WebACL |
| <a name="output_web_acl_name"></a> [web\_acl\_name](#output\_web\_acl\_name) | The name of the WAF WebACL |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
