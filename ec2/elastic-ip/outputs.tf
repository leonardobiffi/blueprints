output "public_ip" {
  description = "The public IP address"
  value       = aws_eip.main.public_ip
}
