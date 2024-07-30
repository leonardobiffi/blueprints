# Load Balancer | Network Load Balancer

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.2.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_alb"></a> [alb](#module\_alb) | terraform-aws-modules/alb/aws | ~> 8.0 |

## Resources

| Name | Type |
|------|------|
| [aws_eip.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_attach_ip"></a> [attach\_ip](#input\_attach\_ip) | Whether or not to attach an IP to the load balancer | `bool` | `false` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Whether or not to create the resource | `bool` | `true` | no |
| <a name="input_env"></a> [env](#input\_env) | The environment to use | `string` | n/a | yes |
| <a name="input_http_tcp_listeners"></a> [http\_tcp\_listeners](#input\_http\_tcp\_listeners) | The HTTP listeners to use | `any` | `[]` | no |
| <a name="input_https_listeners"></a> [https\_listeners](#input\_https\_listeners) | The HTTP listeners to use | `any` | `[]` | no |
| <a name="input_internal"></a> [internal](#input\_internal) | Boolean determining if the load balancer is internal or externally facing. | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the resource | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The AWS region to use | `string` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | The subnets to use | `list(string)` | n/a | yes |
| <a name="input_system_tags"></a> [system\_tags](#input\_system\_tags) | System tags to use. Automatically populated by the terragrunt. | `map(string)` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags to use | `map(string)` | `{}` | no |
| <a name="input_target_groups"></a> [target\_groups](#input\_target\_groups) | The target groups to use | `any` | `[]` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The VPC ID to use | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_elb_arn"></a> [elb\_arn](#output\_elb\_arn) | The ARN of the ELB |
| <a name="output_http_tcp_listener_arns"></a> [http\_tcp\_listener\_arns](#output\_http\_tcp\_listener\_arns) | The ARN of the TCP and HTTP load balancer listeners created. |
| <a name="output_https_listener_arns"></a> [https\_listener\_arns](#output\_https\_listener\_arns) | The ARNs of the HTTPS load balancer listeners created. |
| <a name="output_lb_dns_name"></a> [lb\_dns\_name](#output\_lb\_dns\_name) | The DNS name of the load balancer. |
| <a name="output_lb_zone_id"></a> [lb\_zone\_id](#output\_lb\_zone\_id) | The zone\_id of the load balancer to assist with creating DNS records. |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | VPC ID |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
