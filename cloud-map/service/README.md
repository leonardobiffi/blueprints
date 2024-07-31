# CloudMap | Service

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.33 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.60.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_service_discovery_service.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/service_discovery_service) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dns_record_type"></a> [dns\_record\_type](#input\_dns\_record\_type) | The type of the DNS record | `string` | `"A"` | no |
| <a name="input_dns_ttl"></a> [dns\_ttl](#input\_dns\_ttl) | The TTL of the DNS record | `number` | `60` | no |
| <a name="input_env"></a> [env](#input\_env) | The environment to use | `string` | n/a | yes |
| <a name="input_failure_threshold"></a> [failure\_threshold](#input\_failure\_threshold) | The number of consecutive health checks that an endpoint must pass or fail | `number` | `3` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the resource to create | `string` | n/a | yes |
| <a name="input_namespace_id"></a> [namespace\_id](#input\_namespace\_id) | The ID of the namespace | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The AWS region to use | `string` | n/a | yes |
| <a name="input_routing_policy"></a> [routing\_policy](#input\_routing\_policy) | The routing policy of the service | `string` | `"MULTIVALUE"` | no |
| <a name="input_system_tags"></a> [system\_tags](#input\_system\_tags) | System tags to use. Automatically populated by the terragrunt. | `map(string)` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the resource |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
