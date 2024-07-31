# Load Balancer | Application Load Balancer

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.46 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_alb"></a> [alb](#module\_alb) | terraform-aws-modules/alb/aws | ~> 9.4 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_deletion_protection"></a> [enable\_deletion\_protection](#input\_enable\_deletion\_protection) | Boolean determining if the load balancer is protected from deletion. | `bool` | `false` | no |
| <a name="input_env"></a> [env](#input\_env) | The environment to use | `string` | n/a | yes |
| <a name="input_idle_timeout"></a> [idle\_timeout](#input\_idle\_timeout) | The time in seconds that the connection is allowed to be idle. Only valid for Load Balancers of type `application`. Default: `60` | `number` | `null` | no |
| <a name="input_internal"></a> [internal](#input\_internal) | Boolean determining if the load balancer is internal or externally facing. | `bool` | `false` | no |
| <a name="input_listeners"></a> [listeners](#input\_listeners) | Map of listener configurations to create | `any` | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the SNS topic to create | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The AWS region to use | `string` | n/a | yes |
| <a name="input_security_group_ingress_rules"></a> [security\_group\_ingress\_rules](#input\_security\_group\_ingress\_rules) | The ingress rules to use for the security group | `any` | `{}` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | The subnets to use | `list(string)` | n/a | yes |
| <a name="input_system_tags"></a> [system\_tags](#input\_system\_tags) | System tags to use. Automatically populated by the terragrunt. | `map(string)` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |
| <a name="input_target_groups"></a> [target\_groups](#input\_target\_groups) | The target groups to use | `any` | `[]` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The VPC ID to use | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the ELB |
| <a name="output_dns_name"></a> [dns\_name](#output\_dns\_name) | The DNS name of the load balancer. |
| <a name="output_listeners"></a> [listeners](#output\_listeners) | Map of listeners created and their attributes |
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | Security group ID |
| <a name="output_target_groups"></a> [target\_groups](#output\_target\_groups) | Map of target groups created and their attributes |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | VPC ID |
| <a name="output_zone_id"></a> [zone\_id](#output\_zone\_id) | The zone\_id of the load balancer to assist with creating DNS records. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
