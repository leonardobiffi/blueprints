# Cloudfront | Simple

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
| <a name="module_cloudfront"></a> [cloudfront](#module\_cloudfront) | terraform-aws-modules/cloudfront/aws | ~> 3.2 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acm_certificate_arn"></a> [acm\_certificate\_arn](#input\_acm\_certificate\_arn) | The ARN of the ACM certificate | `string` | n/a | yes |
| <a name="input_custom_error_response"></a> [custom\_error\_response](#input\_custom\_error\_response) | One or more custom error response elements | `any` | `{}` | no |
| <a name="input_default_cache_behavior"></a> [default\_cache\_behavior](#input\_default\_cache\_behavior) | The default cache behavior to use in the CloudFront distribution | `any` | n/a | yes |
| <a name="input_default_root_object"></a> [default\_root\_object](#input\_default\_root\_object) | The default root object to use | `string` | `null` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | The domain name to use | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | The environment to use | `string` | n/a | yes |
| <a name="input_http_version"></a> [http\_version](#input\_http\_version) | The HTTP version to use | `string` | `"http2"` | no |
| <a name="input_minimum_protocol_version"></a> [minimum\_protocol\_version](#input\_minimum\_protocol\_version) | The minimum protocol version to use | `string` | `"TLSv1.2_2021"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the resource to create | `string` | n/a | yes |
| <a name="input_ordered_cache_behavior"></a> [ordered\_cache\_behavior](#input\_ordered\_cache\_behavior) | The ordered cache behavior to use in the CloudFront distribution | `list(any)` | `[]` | no |
| <a name="input_origin"></a> [origin](#input\_origin) | The origin to use in the CloudFront distribution | `any` | n/a | yes |
| <a name="input_origin_access_identities"></a> [origin\_access\_identities](#input\_origin\_access\_identities) | The origin access identities to use | `map(string)` | `{}` | no |
| <a name="input_price_class"></a> [price\_class](#input\_price\_class) | The price class to use | `string` | `"PriceClass_All"` | no |
| <a name="input_region"></a> [region](#input\_region) | The AWS region to use | `string` | n/a | yes |
| <a name="input_subdomain"></a> [subdomain](#input\_subdomain) | The subdomain to use | `string` | `null` | no |
| <a name="input_system_tags"></a> [system\_tags](#input\_system\_tags) | System tags to use. Automatically populated by the terragrunt. | `map(string)` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |
| <a name="input_wait_for_deployment"></a> [wait\_for\_deployment](#input\_wait\_for\_deployment) | Whether to wait for the deployment to complete | `bool` | `true` | no |
| <a name="input_web_acl_id"></a> [web\_acl\_id](#input\_web\_acl\_id) | If you're using AWS WAF to filter CloudFront requests, the Id of the AWS WAF web ACL that is associated with the distribution. The WAF Web ACL must exist in the WAF Global (CloudFront) region and the credentials configuring this argument must have waf:GetWebACL permissions assigned. If using WAFv2, provide the ARN of the web ACL. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudfront_arn"></a> [cloudfront\_arn](#output\_cloudfront\_arn) | The CloudFront ARN |
| <a name="output_cloudfront_domain"></a> [cloudfront\_domain](#output\_cloudfront\_domain) | The CloudFront domain name |
| <a name="output_cloudfront_id"></a> [cloudfront\_id](#output\_cloudfront\_id) | The CloudFront ID |
| <a name="output_cloudfront_zone_id"></a> [cloudfront\_zone\_id](#output\_cloudfront\_zone\_id) | The CloudFront Hosted Zone ID |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
