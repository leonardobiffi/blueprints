# S3 | Simple

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.15 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.60.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_s3"></a> [s3](#module\_s3) | terraform-aws-modules/s3-bucket/aws | ~> 4.1 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy_document.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_block_public_acls"></a> [block\_public\_acls](#input\_block\_public\_acls) | Whether to block public acls | `bool` | `true` | no |
| <a name="input_block_public_policy"></a> [block\_public\_policy](#input\_block\_public\_policy) | Whether to block public policy | `bool` | `true` | no |
| <a name="input_cors_rule"></a> [cors\_rule](#input\_cors\_rule) | The CORS rule to use | `list(any)` | `[]` | no |
| <a name="input_env"></a> [env](#input\_env) | The environment to use | `string` | n/a | yes |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | Whether to force destroy | `bool` | `false` | no |
| <a name="input_ignore_public_acls"></a> [ignore\_public\_acls](#input\_ignore\_public\_acls) | Whether to ignore public acls | `bool` | `true` | no |
| <a name="input_lifecycle_rule"></a> [lifecycle\_rule](#input\_lifecycle\_rule) | The lifecycle rule to use | `list(any)` | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | The name to use | `string` | n/a | yes |
| <a name="input_policy"></a> [policy](#input\_policy) | The policy statements to use | <pre>list(object({<br>    sid       = optional(string)<br>    effect    = string<br>    actions   = list(string)<br>    resources = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_region"></a> [region](#input\_region) | The AWS region to use | `string` | n/a | yes |
| <a name="input_restrict_public_buckets"></a> [restrict\_public\_buckets](#input\_restrict\_public\_buckets) | Whether to restrict public buckets | `bool` | `true` | no |
| <a name="input_server_side_encryption_configuration"></a> [server\_side\_encryption\_configuration](#input\_server\_side\_encryption\_configuration) | The server side encryption configuration to use | `any` | `{}` | no |
| <a name="input_system_tags"></a> [system\_tags](#input\_system\_tags) | System tags to use. Automatically populated by the terragrunt. | `map(string)` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags to use | `map(string)` | `{}` | no |
| <a name="input_versioning"></a> [versioning](#input\_versioning) | The versioning to use | `map(string)` | `{}` | no |
| <a name="input_website"></a> [website](#input\_website) | The website to use | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_s3_bucket_arn"></a> [s3\_bucket\_arn](#output\_s3\_bucket\_arn) | The S3 bucket ARN |
| <a name="output_s3_bucket_domain_name"></a> [s3\_bucket\_domain\_name](#output\_s3\_bucket\_domain\_name) | The S3 bucket domain name |
| <a name="output_s3_bucket_id"></a> [s3\_bucket\_id](#output\_s3\_bucket\_id) | The S3 bucket name |
| <a name="output_s3_bucket_website_endpoint"></a> [s3\_bucket\_website\_endpoint](#output\_s3\_bucket\_website\_endpoint) | The S3 bucket regional domain name |
| <a name="output_s3_domain"></a> [s3\_domain](#output\_s3\_domain) | The S3 domain name |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
