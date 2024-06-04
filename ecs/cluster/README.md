# ECS | Cluster

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
| <a name="module_ecs_cluster"></a> [ecs\_cluster](#module\_ecs\_cluster) | terraform-aws-modules/ecs/aws//modules/cluster | ~> 5.7 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_container_insights"></a> [container\_insights](#input\_container\_insights) | Whether to enable container insights. Valid values are enabled or disabled. | `string` | `"disabled"` | no |
| <a name="input_create_cloudwatch_log_group"></a> [create\_cloudwatch\_log\_group](#input\_create\_cloudwatch\_log\_group) | Whether to create a CloudWatch log group for the cluster | `bool` | `false` | no |
| <a name="input_env"></a> [env](#input\_env) | The environment to use | `string` | n/a | yes |
| <a name="input_fargate_capacity_base"></a> [fargate\_capacity\_base](#input\_fargate\_capacity\_base) | The base of the Fargate capacity provider strategy | `number` | `1` | no |
| <a name="input_fargate_capacity_weight"></a> [fargate\_capacity\_weight](#input\_fargate\_capacity\_weight) | The weight of the Fargate capacity provider strategy | `number` | `1` | no |
| <a name="input_fargate_spot_capacity_base"></a> [fargate\_spot\_capacity\_base](#input\_fargate\_spot\_capacity\_base) | The base of the Fargate spot capacity provider strategy | `number` | `null` | no |
| <a name="input_fargate_spot_capacity_weight"></a> [fargate\_spot\_capacity\_weight](#input\_fargate\_spot\_capacity\_weight) | The weight of the Fargate spot capacity provider strategy | `number` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the resource | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The AWS region to use | `string` | n/a | yes |
| <a name="input_system_tags"></a> [system\_tags](#input\_system\_tags) | System tags to use. Automatically populated by the terragrunt. | `map(string)` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags to use | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | ARN that identifies the cluster |
| <a name="output_capacity_providers"></a> [capacity\_providers](#output\_capacity\_providers) | Map of cluster capacity providers attributes |
| <a name="output_id"></a> [id](#output\_id) | ID that identifies the cluster |
| <a name="output_name"></a> [name](#output\_name) | Name that identifies the cluster |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
