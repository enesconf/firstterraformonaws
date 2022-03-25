output "key_name" {
  value       = aws_instance.web.key_name
  description = "Name of SSH key"
}


output "public_ip" {
  value       = aws_eip_association.eip_assoc.public_ip
  description = "Public ip adress"
}

output "instance_type" {
  value       = aws_instance.web.instance_type
  description = "instance type"
}

