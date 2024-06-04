# Route53 | Zones

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.20 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_zones"></a> [zones](#module\_zones) | terraform-aws-modules/route53/aws//modules/zones | ~> 2.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_env"></a> [env](#input\_env) | The environment to use | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The AWS region to use | `string` | n/a | yes |
| <a name="input_system_tags"></a> [system\_tags](#input\_system\_tags) | System tags to use. Automatically populated by the terragrunt. | `map(string)` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags to use | `map(string)` | `{}` | no |
| <a name="input_zones"></a> [zones](#input\_zones) | Map of Route53 zone parameters | <pre>list(object({<br>    name    = string<br>    comment = optional(string)<br>    tags    = optional(map(string))<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_name"></a> [name](#output\_name) | Name of Route53 zone |
| <a name="output_name_servers"></a> [name\_servers](#output\_name\_servers) | Name servers of Route53 zone |
| <a name="output_zone_arn"></a> [zone\_arn](#output\_zone\_arn) | Zone ARN of Route53 zone |
| <a name="output_zone_id"></a> [zone\_id](#output\_zone\_id) | Zone ID of Route53 zone |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
