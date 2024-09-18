variable "ami" {
  description = "The AMI to use for the instance"
  type        = string
  default     = "ami-0e86e20dae9224db8"
}

variable "instance_type" {
  description = "The type of instance to create"
  type        = string
  default     = "t2.small"
}

variable "instance_name" {
  description = "The name of the instance"
  type        = string
  default     = "medusa-backend-server"
}
