# Cloudfront | S3 WebSite

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.46 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.60.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cloudfront"></a> [cloudfront](#module\_cloudfront) | terraform-aws-modules/cloudfront/aws | ~> 3.2 |

## Resources

| Name | Type |
|------|------|
| [aws_s3_bucket_policy.bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_iam_policy_document.s3_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acm_certificate_arn"></a> [acm\_certificate\_arn](#input\_acm\_certificate\_arn) | The ARN of the ACM certificate | `string` | `null` | no |
| <a name="input_create_origin_access_identity"></a> [create\_origin\_access\_identity](#input\_create\_origin\_access\_identity) | Whether to create an origin access identity | `bool` | `false` | no |
| <a name="input_custom_error_response"></a> [custom\_error\_response](#input\_custom\_error\_response) | One or more custom error response elements | `any` | `{}` | no |
| <a name="input_default_cache_behavior"></a> [default\_cache\_behavior](#input\_default\_cache\_behavior) | The default cache behavior to use in the CloudFront distribution | `any` | n/a | yes |
| <a name="input_default_root_object"></a> [default\_root\_object](#input\_default\_root\_object) | The default root object to use | `string` | `"index.html"` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | The domain name to use | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | The environment to use | `string` | n/a | yes |
| <a name="input_minimum_protocol_version"></a> [minimum\_protocol\_version](#input\_minimum\_protocol\_version) | The minimum protocol version to use | `string` | `"TLSv1.2_2021"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the SNS topic to create | `string` | n/a | yes |
| <a name="input_ordered_cache_behavior"></a> [ordered\_cache\_behavior](#input\_ordered\_cache\_behavior) | The ordered cache behavior to use in the CloudFront distribution | `list(any)` | `[]` | no |
| <a name="input_origin"></a> [origin](#input\_origin) | The origin to use in the CloudFront distribution | `any` | n/a | yes |
| <a name="input_origin_access_identities"></a> [origin\_access\_identities](#input\_origin\_access\_identities) | The origin access identities to use | `map(string)` | `{}` | no |
| <a name="input_region"></a> [region](#input\_region) | The AWS region to use | `string` | n/a | yes |
| <a name="input_s3_origin_buckets"></a> [s3\_origin\_buckets](#input\_s3\_origin\_buckets) | The S3 origin buckets to use | <pre>list(object({<br>    id  = string<br>    arn = string<br>  }))</pre> | `[]` | no |
| <a name="input_subdomain"></a> [subdomain](#input\_subdomain) | The subdomain to use | `string` | `null` | no |
| <a name="input_system_tags"></a> [system\_tags](#input\_system\_tags) | System tags to use. Automatically populated by the terragrunt. | `map(string)` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |
| <a name="input_wait_for_deployment"></a> [wait\_for\_deployment](#input\_wait\_for\_deployment) | Whether to wait for the deployment to complete | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudfront_arn"></a> [cloudfront\_arn](#output\_cloudfront\_arn) | The CloudFront ARN |
| <a name="output_cloudfront_domain"></a> [cloudfront\_domain](#output\_cloudfront\_domain) | The CloudFront domain name |
| <a name="output_cloudfront_id"></a> [cloudfront\_id](#output\_cloudfront\_id) | The CloudFront ID |
| <a name="output_cloudfront_zone_id"></a> [cloudfront\_zone\_id](#output\_cloudfront\_zone\_id) | The CloudFront Hosted Zone ID |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
