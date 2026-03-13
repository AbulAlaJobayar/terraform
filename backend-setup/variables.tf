variable "aws_region" {
  description = "The AWS region to create resources in."
  type        = string
  default     = "eu-north-1"
}
variable "bucket_name" {
  description = "The name of the S3 bucket to store Terraform state."
  type        = string
  default     = "jobayar-terraform-state"
}
variable "lock_table" {
  description = "The name of the DynamoDB table to store Terraform locks."
  type        = string
  default     = "terraform-locks"
}
variable "environment" {
  description = "The environment for the Terraform state and locks."
  type        = string
  default     = "dev"
}