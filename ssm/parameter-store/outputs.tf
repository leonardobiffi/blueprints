output "arn" {
  description = "The ARN of the parameter"
  value       = module.parameter.ssm_parameter_arn
}

output "version" {
  description = "Version of the parameter"
  value       = module.parameter.ssm_parameter_version
}

output "name" {
  description = "Name of the parameter"
  value       = module.parameter.ssm_parameter_name
}
