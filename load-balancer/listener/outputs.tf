output "listener_http_arn" {
  description = "ARN of the load balancer listener."
  value       = aws_lb_listener.http[*].arn
}

output "listener_https_arn" {
  description = "ARN of the load balancer listener."
  value       = aws_lb_listener.https[*].arn
}

output "listener_rule_https_arn" {
  description = "ARN of the load balancer listener rule."
  value       = aws_lb_listener_rule.https_rule[*].arn
}

output "listener_rule_http_arn" {
  description = "ARN of the load balancer listener rule."
  value       = aws_lb_listener_rule.http_rule[*].arn
}
