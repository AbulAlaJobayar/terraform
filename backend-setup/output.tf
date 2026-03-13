output "s3_bucket_name" {
  value = aws_s3_bucket.terraform_state
}
output "dynamodb_table_name" {
  value = aws_dynamodb_table.terraform_locks
}