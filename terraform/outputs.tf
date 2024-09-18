output "instance_id" {
  description = "The ID of the instance"
  value       = aws_instance.builtbyterraform.id
}

output "instance_public_ip" {
  description = "The public IP address of the instance"
  value       = aws_instance.builtbyterraform.public_ip
}
