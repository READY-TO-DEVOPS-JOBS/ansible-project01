# Terraform output values
# In terraform/outputs.tf

output "controller_public_ip" {
  description = "Public IP address of the controller server"
  value       = aws_instance.controller_server.public_ip
}

output "controller_private_ip" {
  description = "Private IP address of the controller server"
  value       = aws_instance.controller_server.private_ip
}

output "agent_public_ips" {
  description = "Public IP addresses of the agent servers"
  value       = aws_instance.agent_servers[*].public_ip
}

output "agent_private_ips" {
  description = "Private IP addresses of the agent servers"
  value       = aws_instance.agent_servers[*].private_ip
}

output "security_group_id" {
  description = "ID of the security group"
  value       = aws_security_group.allow_ssh.id
}