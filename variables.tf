variable "default_region" {
  description = "Default AWS region"
  type        = string
  default     = "eu-central-1"
}

variable "instance_type" {
  description = "Instance type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Key pair name for EC2 SSH access"
  type        = string
  default = "EC2Tutorial.pem"
}
