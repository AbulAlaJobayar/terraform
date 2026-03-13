provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = var.bucket_name
  force_destroy = true

  versioning {
    enabled = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
    sse_algorithm = "AES256"
      }
    }
  }
  tags = {
    Name="terraform_state_bucket"
    Environment=var.environment
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name = var.lock_table
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Name="terraform Lock Bucket"
    environment=var.environment
  }
}