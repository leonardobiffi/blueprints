output "arn" {
  description = "The ARN of the function"
  value       = module.lambda_function.lambda_function_arn
}

output "name" {
  description = "The name of the function"
  value       = module.lambda_function.lambda_function_name
}

output "invoke_arn" {
  description = "The ARN to be used for invoking Lambda Function from API Gateway"
  value       = module.lambda_function.lambda_function_invoke_arn
}
