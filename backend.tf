terraform {
  backend "s3"{
    bucket = "jobayar-terraform-state"
    key = "dev/project/terraform.tfstate"
    region = "eu-north-1"
    dynamodb_table = "terraform-locks"
    encrypt = true
  }
}