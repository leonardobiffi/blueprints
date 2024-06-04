output "id" {
  description = "The ID of the EC2 instance"
  value       = module.ec2_instance.id
}

output "elastic_ip" {
  description = "The elastic IP of the EC2 instance"
  value       = try(aws_eip.main[0].public_ip, null)
}

output "private_ip" {
  description = "The private IP of the EC2 instance"
  value       = module.ec2_instance.private_ip
}

output "availability_zone" {
  description = "The availability zone of the EC2 instance"
  value       = module.ec2_instance.availability_zone
}
