# S3 | Website

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.15 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_s3"></a> [s3](#module\_s3) | terraform-aws-modules/s3-bucket/aws | ~> 4.1 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cors_rule"></a> [cors\_rule](#input\_cors\_rule) | The CORS rule to use | `list(any)` | `[]` | no |
| <a name="input_env"></a> [env](#input\_env) | The environment to use | `string` | n/a | yes |
| <a name="input_error_document"></a> [error\_document](#input\_error\_document) | The error document to use | `string` | `"error.html"` | no |
| <a name="input_index_document"></a> [index\_document](#input\_index\_document) | The index document to use | `string` | `"index.html"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the SNS topic to create | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The AWS region to use | `string` | n/a | yes |
| <a name="input_system_tags"></a> [system\_tags](#input\_system\_tags) | System tags to use. Automatically populated by the terragrunt. | `map(string)` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_s3_bucket_arn"></a> [s3\_bucket\_arn](#output\_s3\_bucket\_arn) | The S3 bucket ARN |
| <a name="output_s3_bucket_id"></a> [s3\_bucket\_id](#output\_s3\_bucket\_id) | The S3 bucket ID |
| <a name="output_s3_domain"></a> [s3\_domain](#output\_s3\_domain) | The S3 domain name |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
