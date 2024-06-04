output "id" {
  description = "The ID of the VPC link"
  value       = var.api_gateway_version == "v1" ? aws_api_gateway_vpc_link.main[0].id : aws_apigatewayv2_vpc_link.main[0].id
}

output "arn" {
  description = "The ARN of the VPC link"
  value       = var.api_gateway_version == "v1" ? aws_api_gateway_vpc_link.main[0].arn : aws_apigatewayv2_vpc_link.main[0].arn
}
