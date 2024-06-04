output "id" {
  description = "The ID of the REST API"
  value       = aws_apigatewayv2_api.main.id
}

output "target_domain_name" {
  description = "The target domain name of the REST API"
  value       = aws_apigatewayv2_domain_name.main.domain_name_configuration[0].target_domain_name
}

output "hosted_zone_id" {
  description = "The hosted zone ID of the REST API"
  value       = aws_apigatewayv2_domain_name.main.domain_name_configuration[0].hosted_zone_id
}
