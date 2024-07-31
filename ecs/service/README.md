# ECS | Service

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
| <a name="module_ecs_service"></a> [ecs\_service](#module\_ecs\_service) | terraform-aws-modules/ecs/aws//modules/service | ~> 5.11 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_autoscaling_max_capacity"></a> [autoscaling\_max\_capacity](#input\_autoscaling\_max\_capacity) | The maximum number of instances of the task definition to place and keep running | `number` | `1` | no |
| <a name="input_autoscaling_min_capacity"></a> [autoscaling\_min\_capacity](#input\_autoscaling\_min\_capacity) | The minimum number of instances of the task definition to place and keep running | `number` | `1` | no |
| <a name="input_capacity_provider_strategy"></a> [capacity\_provider\_strategy](#input\_capacity\_provider\_strategy) | Capacity provider strategies to use for the service. Can be one or more | `any` | `{}` | no |
| <a name="input_cluster_arn"></a> [cluster\_arn](#input\_cluster\_arn) | The ARN of the cluster | `string` | n/a | yes |
| <a name="input_command"></a> [command](#input\_command) | The command that is passed to the container | `list(string)` | `[]` | no |
| <a name="input_container_port"></a> [container\_port](#input\_container\_port) | The port to use for the container | `number` | `null` | no |
| <a name="input_cpu"></a> [cpu](#input\_cpu) | The number of cpu units to reserve for the container. Required if FARAGATE launch type is used | `number` | `null` | no |
| <a name="input_create_ecr"></a> [create\_ecr](#input\_create\_ecr) | Whether to create an ECR repository | `bool` | `true` | no |
| <a name="input_create_iam_role"></a> [create\_iam\_role](#input\_create\_iam\_role) | Whether to create an IAM role for the service | `bool` | `true` | no |
| <a name="input_create_tasks_iam_role"></a> [create\_tasks\_iam\_role](#input\_create\_tasks\_iam\_role) | Whether to create an IAM role for the tasks | `bool` | `true` | no |
| <a name="input_deployment_circuit_breaker"></a> [deployment\_circuit\_breaker](#input\_deployment\_circuit\_breaker) | Configuration block for deployment circuit breaker | `any` | <pre>{<br>  "enable": true,<br>  "rollback": true<br>}</pre> | no |
| <a name="input_desired_count"></a> [desired\_count](#input\_desired\_count) | The number of instances of the task definition to place and keep running | `number` | `1` | no |
| <a name="input_ecr_name"></a> [ecr\_name](#input\_ecr\_name) | The name of the ECR repository to use | `string` | `null` | no |
| <a name="input_enable_autoscaling"></a> [enable\_autoscaling](#input\_enable\_autoscaling) | Determines whether to enable autoscaling for the service | `bool` | `true` | no |
| <a name="input_env"></a> [env](#input\_env) | The environment to use | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment variables to pass to the container | <pre>list(object({<br>    name  = string<br>    value = string<br>  }))</pre> | `[]` | no |
| <a name="input_health_check"></a> [health\_check](#input\_health\_check) | The container health check command and associated configuration parameters for the container. See [HealthCheck](https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_HealthCheck.html) | `any` | `{}` | no |
| <a name="input_health_check_grace_period_seconds"></a> [health\_check\_grace\_period\_seconds](#input\_health\_check\_grace\_period\_seconds) | Seconds to ignore failing load balancer health checks on newly instantiated tasks to prevent premature shutdown, up to 2147483647. Only valid for services configured to use load balancers | `number` | `null` | no |
| <a name="input_image"></a> [image](#input\_image) | The image to use for the container | `string` | `null` | no |
| <a name="input_image_tag"></a> [image\_tag](#input\_image\_tag) | The image tag to use for the container | `string` | `null` | no |
| <a name="input_launch_type"></a> [launch\_type](#input\_launch\_type) | The launch type to use for the service ("EC2" or "FARGATE"). | `string` | `null` | no |
| <a name="input_memory"></a> [memory](#input\_memory) | The amount of memory to reserve for the container. Required if FARAGATE launch type is used | `number` | `null` | no |
| <a name="input_memory_reservation"></a> [memory\_reservation](#input\_memory\_reservation) | The amount of memory to reserve for the container | `number` | `null` | no |
| <a name="input_mount_points"></a> [mount\_points](#input\_mount\_points) | The mount points for data volumes in your container | `list(any)` | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the resource | `string` | n/a | yes |
| <a name="input_network_mode"></a> [network\_mode](#input\_network\_mode) | The network mode to use for the task. The valid values are `none`, `bridge`, `awsvpc`, and `host` | `string` | `"awsvpc"` | no |
| <a name="input_platform_version"></a> [platform\_version](#input\_platform\_version) | Platform version on which to run your service. Only applicable for `launch_type` set to `FARGATE`. Defaults to `LATEST` | `string` | `"LATEST"` | no |
| <a name="input_propagate_tags"></a> [propagate\_tags](#input\_propagate\_tags) | Specifies whether to propagate the tags from the task definition or the service to the tasks. The valid values are `SERVICE` and `TASK_DEFINITION` | `string` | `"TASK_DEFINITION"` | no |
| <a name="input_region"></a> [region](#input\_region) | The AWS region to use | `string` | n/a | yes |
| <a name="input_requires_compatibilities"></a> [requires\_compatibilities](#input\_requires\_compatibilities) | Set of launch types required by the task. The valid values are `EC2` and `FARGATE` | `list(string)` | <pre>[<br>  "FARGATE"<br>]</pre> | no |
| <a name="input_scheduling_strategy"></a> [scheduling\_strategy](#input\_scheduling\_strategy) | Scheduling strategy to use for the service. The valid values are `REPLICA` and `DAEMON`. Defaults to `REPLICA` | `string` | `null` | no |
| <a name="input_secrets"></a> [secrets](#input\_secrets) | The secrets to pass to the container. For more information, see [Specifying Sensitive Data](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/specifying-sensitive-data.html) in the Amazon Elastic Container Service Developer Guide | <pre>list(object({<br>    name      = string<br>    valueFrom = string<br>  }))</pre> | `[]` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | List of security groups to associate with the task or service | `list(string)` | `[]` | no |
| <a name="input_security_group_rules"></a> [security\_group\_rules](#input\_security\_group\_rules) | Security group rules to add to the security group created | `any` | `{}` | no |
| <a name="input_service_registries"></a> [service\_registries](#input\_service\_registries) | Service discovery registries for the service | `any` | `{}` | no |
| <a name="input_service_tags"></a> [service\_tags](#input\_service\_tags) | Tags to add to the service only | `map(string)` | `{}` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | The subnet IDs to use | `list(string)` | `[]` | no |
| <a name="input_system_tags"></a> [system\_tags](#input\_system\_tags) | System tags to use. Automatically populated by the terragrunt. | `map(string)` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags to use | `map(string)` | `{}` | no |
| <a name="input_target_group_arn"></a> [target\_group\_arn](#input\_target\_group\_arn) | The ARN of the target group to use | `string` | `null` | no |
| <a name="input_target_port"></a> [target\_port](#input\_target\_port) | The port to use for the target group | `number` | `null` | no |
| <a name="input_tasks_iam_role_policies"></a> [tasks\_iam\_role\_policies](#input\_tasks\_iam\_role\_policies) | Map of IAM role policy ARNs to attach to the IAM role | `map(string)` | `{}` | no |
| <a name="input_tasks_iam_role_statements"></a> [tasks\_iam\_role\_statements](#input\_tasks\_iam\_role\_statements) | A map of IAM policy [statements](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document#statement) for custom permission usage | `any` | `{}` | no |
| <a name="input_volume"></a> [volume](#input\_volume) | Configuration block for volumes that containers in your task may use | `any` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the service |
| <a name="output_repository_url"></a> [repository\_url](#output\_repository\_url) | The URL of the ECR repository |
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | The ID of the security group |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
