output "arn" {
  description = "The ARN of the IP set"
  value       = aws_wafv2_ip_set.main.arn
}

output "id" {
  description = "The ID of the IP set"
  value       = aws_wafv2_ip_set.main.id
}
