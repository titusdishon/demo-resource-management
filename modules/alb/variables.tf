
variable "subnet_id" {}
variable "vpc_id" {
  type        = string
  description = "VPC ID where the ALB will be created"
}

variable "target_instance_id" {
  type        = string
  description = "EC2 instance ID to register with the ALB"
}