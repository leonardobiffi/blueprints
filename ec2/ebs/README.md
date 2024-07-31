# EC2 | EBS

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
| [aws_ebs_volume.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ebs_volume) | resource |
| [aws_volume_attachment.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/volume_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | The availability zone to use | `string` | n/a | yes |
| <a name="input_device_name"></a> [device\_name](#input\_device\_name) | The device name to use | `string` | n/a | yes |
| <a name="input_encrypted"></a> [encrypted](#input\_encrypted) | Whether the volume should be encrypted | `bool` | `true` | no |
| <a name="input_env"></a> [env](#input\_env) | The environment to use | `string` | n/a | yes |
| <a name="input_instance_id"></a> [instance\_id](#input\_instance\_id) | The type of instance to use | `string` | n/a | yes |
| <a name="input_iops"></a> [iops](#input\_iops) | The IOPS of the volume | `number` | `null` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | The KMS key ID to use | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the resource | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The AWS region to use | `string` | n/a | yes |
| <a name="input_size"></a> [size](#input\_size) | The size of the volume | `number` | n/a | yes |
| <a name="input_system_tags"></a> [system\_tags](#input\_system\_tags) | System tags to use. Automatically populated by the terragrunt. | `map(string)` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags to use | `map(string)` | `{}` | no |
| <a name="input_throughput"></a> [throughput](#input\_throughput) | The throughput that the volume supports, in MiB/s. Only valid for type of gp3 | `number` | `null` | no |
| <a name="input_type"></a> [type](#input\_type) | The type of the volume | `string` | `"gp3"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the volume |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
