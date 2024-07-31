# API Gateway | HTTP

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.48 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.60.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_apigatewayv2_api.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_api) | resource |
| [aws_apigatewayv2_api_mapping.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_api_mapping) | resource |
| [aws_apigatewayv2_authorizer.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_authorizer) | resource |
| [aws_apigatewayv2_domain_name.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_domain_name) | resource |
| [aws_apigatewayv2_integration.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_integration) | resource |
| [aws_apigatewayv2_route.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_route) | resource |
| [aws_apigatewayv2_stage.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_stage) | resource |
| [aws_cloudwatch_log_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_log_settings"></a> [access\_log\_settings](#input\_access\_log\_settings) | The access log settings to use | <pre>object({<br>    enabled        = bool<br>    format         = optional(string, null)<br>    retention_days = optional(number, 7)<br>  })</pre> | `null` | no |
| <a name="input_authorizers"></a> [authorizers](#input\_authorizers) | The authorizers to use | <pre>map(object({<br>    type                    = string<br>    identity_sources        = list(string)<br>    jwt_issuer              = optional(string, null)<br>    jwt_audience            = optional(list(string), [])<br>    uri                     = optional(string, null)<br>    payload_format_version  = optional(string, null)<br>    result_ttl_in_seconds   = optional(number, 0)<br>    enable_simple_responses = optional(bool, false)<br>  }))</pre> | `{}` | no |
| <a name="input_body"></a> [body](#input\_body) | The OpenAPI specification to use | `string` | `null` | no |
| <a name="input_certificate_arn"></a> [certificate\_arn](#input\_certificate\_arn) | The ARN of the certificate to use | `string` | n/a | yes |
| <a name="input_cors_configuration"></a> [cors\_configuration](#input\_cors\_configuration) | The CORS configuration to use | <pre>object({<br>    allow_origins     = list(string)<br>    allow_methods     = list(string)<br>    allow_headers     = list(string)<br>    expose_headers    = list(string)<br>    allow_credentials = bool<br>    max_age           = number<br>  })</pre> | `null` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | The domain name to use | `string` | n/a | yes |
| <a name="input_endpoint_type"></a> [endpoint\_type](#input\_endpoint\_type) | The endpoint type to use | `string` | `"REGIONAL"` | no |
| <a name="input_env"></a> [env](#input\_env) | The environment to use | `string` | n/a | yes |
| <a name="input_hosted_zone_id"></a> [hosted\_zone\_id](#input\_hosted\_zone\_id) | The hosted zone ID to use | `string` | `null` | no |
| <a name="input_logging_level"></a> [logging\_level](#input\_logging\_level) | The logging level to use | `string` | `"ERROR"` | no |
| <a name="input_metrics_enabled"></a> [metrics\_enabled](#input\_metrics\_enabled) | Whether to enable detailed metrics | `bool` | `false` | no |
| <a name="input_mtls_enabled"></a> [mtls\_enabled](#input\_mtls\_enabled) | Whether to enable mutual TLS authentication | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the resource | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The AWS region to use | `string` | n/a | yes |
| <a name="input_routes"></a> [routes](#input\_routes) | The routes and integrations to use | <pre>map(object({<br>    integration_type       = string<br>    integration_uri        = string<br>    integration_method     = string<br>    connection_type        = string<br>    connection_id          = string<br>    authorizer             = optional(string, null)<br>    authorization_type     = optional(string, null)<br>    request_parameters     = optional(map(string), {})<br>    server_name_to_verify  = optional(string, null)<br>    payload_format_version = optional(string, "1.0")<br>    timeout_milliseconds   = optional(number, 30000)<br>    response_parameters = optional(list(object({<br>      status_code = number<br>      mappings    = map(string)<br>    })), [])<br>  }))</pre> | `{}` | no |
| <a name="input_security_policy"></a> [security\_policy](#input\_security\_policy) | The security policy to use | `string` | `"TLS_1_2"` | no |
| <a name="input_system_tags"></a> [system\_tags](#input\_system\_tags) | System tags to use. Automatically populated by the terragrunt. | `map(string)` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |
| <a name="input_target_domain_name"></a> [target\_domain\_name](#input\_target\_domain\_name) | The target domain name to use | `string` | `null` | no |
| <a name="input_throttling"></a> [throttling](#input\_throttling) | The throttling burst limit and rate limit to use | <pre>object({<br>    rate_limit  = number<br>    burst_limit = number<br>  })</pre> | <pre>{<br>  "burst_limit": 5000,<br>  "rate_limit": 10000<br>}</pre> | no |
| <a name="input_truststore_uri"></a> [truststore\_uri](#input\_truststore\_uri) | The URI of the truststore to use | `string` | `null` | no |
| <a name="input_truststore_version"></a> [truststore\_version](#input\_truststore\_version) | The version of the truststore to use | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_hosted_zone_id"></a> [hosted\_zone\_id](#output\_hosted\_zone\_id) | The hosted zone ID of the REST API |
| <a name="output_id"></a> [id](#output\_id) | The ID of the REST API |
| <a name="output_target_domain_name"></a> [target\_domain\_name](#output\_target\_domain\_name) | The target domain name of the REST API |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
