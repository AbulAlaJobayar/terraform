variable "aws_region" {
  description = "The AWS region to create resources in."
  type        = string
  default     = "eu-north-1"
}

variable "instance_type" {
  description = "The type of EC2 instance to create."
  type        = string
  default     = "t3.micro"
}

variable "instance_name" {
  description = "The name of the EC2 instance."
  type        = string
  default     = "MyEC2Instance"
}
