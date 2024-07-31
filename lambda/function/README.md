# Lambda | Function

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
| <a name="module_lambda_function"></a> [lambda\_function](#module\_lambda\_function) | terraform-aws-modules/lambda/aws | ~> 7.4 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_triggers"></a> [allowed\_triggers](#input\_allowed\_triggers) | The allowed triggers of the lambda | `map(any)` | `{}` | no |
| <a name="input_cloudwatch_logs_retention_in_days"></a> [cloudwatch\_logs\_retention\_in\_days](#input\_cloudwatch\_logs\_retention\_in\_days) | The retention in days of the cloudwatch logs | `number` | `7` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of the resource | `string` | `null` | no |
| <a name="input_env"></a> [env](#input\_env) | The environment to use | `string` | n/a | yes |
| <a name="input_environment_variables"></a> [environment\_variables](#input\_environment\_variables) | The environment variables of the lambda | `map(string)` | `{}` | no |
| <a name="input_handler"></a> [handler](#input\_handler) | The handler of the lambda function | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the resource | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The AWS region to use | `string` | n/a | yes |
| <a name="input_runtime"></a> [runtime](#input\_runtime) | The runtime of the lambda function | `string` | n/a | yes |
| <a name="input_source_path"></a> [source\_path](#input\_source\_path) | The source path of the function | `string` | n/a | yes |
| <a name="input_system_tags"></a> [system\_tags](#input\_system\_tags) | System tags to use. Automatically populated by the terragrunt. | `map(string)` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags to use | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the function |
| <a name="output_invoke_arn"></a> [invoke\_arn](#output\_invoke\_arn) | The ARN to be used for invoking Lambda Function from API Gateway |
| <a name="output_name"></a> [name](#output\_name) | The name of the function |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
