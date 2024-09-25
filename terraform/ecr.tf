
resource "aws_ecr_repository" "medus-backend-server" {
  name = "medusa-backend-prod"
  image_tag_mutability = "IMMUTABLE"
}
output "ecr_repository_name" {
  description = "The name of the ECR repository"
  value       = aws_ecr_repository.medus-backend-server.name
}

output "ecr_repository_uri" {
  description = "The URI of the ECR repository"
  value       = aws_ecr_repository.medus-backend-server.repository_url
}
