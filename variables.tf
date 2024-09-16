variable "ami" {
  description = "The AMI to use for the instance"
  type        = string
  default     = "ami-0522ab6e1ddcc7055"
}

variable "instance_type" {
  description = "The type of instance to create"
  type        = string
  default     = "t2.micro"
}

variable "instance_name" {
  description = "The name of the instance"
  type        = string
  default     = "medusa-backend-server"
}
