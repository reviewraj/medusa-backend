output "instance_id" {
  description = "The ID of the instance"
  value       = aws_instance.my_instance.id
}

output "instance_public_ip" {
  description = "The public IP address of the instance"
  value       = aws_instance.my_instance.public_ip
}
