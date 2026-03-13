# provider "aws" {
#   region = "eu-north-1"
# }

# resource "aws_instance" "myEc2" {
#   ami           = "ami-073130f74f5ffb161"
#   instance_type = "t3.micro"
#   tags = {
#     Name = "myFirstEc2"
#   }
# }


# variables and tags

# provider "aws" {
#   region = var.aws_region
# }

# data "aws_ami" "ubuntu" {
#   most_recent  =true
#   owners = ["amazon"]
#   filter {
#     name = "name"
#     values = ["amzn2-ami-hvm-*-x86_64-gp2"]
#   }
# }

# resource "aws_instance" "myec2" {
#   ami =data.aws_ami.ubuntu.id
#   instance_type = var.instance_type
#   tags = {
#     Name= var.instance_name
#   }
# }

# conditional expression and locals
# provider "aws" {
#   region = var.aws_region
# }
# data "aws_ami" "ubuntu" {
#   most_recent = true
#   owners      = ["amazon"]
#   filter {
#     name   = "name"
#     values = ["amzn2-ami-hvm-*-x86_64-gp2"]
#   }
# }
# locals {
#   name_tag = var.instance_type == "t3.micro" ? "micro instance" : "standard instance"
# }
# resource "aws_instance" "my_ec2" {
#   ami           = data.aws_ami.ubuntu.id
#   instance_type = var.instance_type
#   tags = {
#     Name =local.name_tag
#   }

# }


#  Resource Dependencies & depends_on

# provider "aws" {
#   region = var.aws_region
# }
# data "aws_ami" "ubuntu" {
#   most_recent = true
#   owners      = ["amazon"]
#   filter {
#     name   = "name"
#     values = ["amzn2-ami-hvm-*-x86_64-gp2"]
#   }
# }
# resource "aws_s3_bucket" "my_bucket" {
#   bucket = var.bucket_name
#   tags = {
#     Name = "MyS3Bucket"
#   }
# }
# locals {
#   name_tag = var.instance_type == "t3.micro" ? "micro instance" : "standard instance"
# }
# resource "aws_instance" "my_ec2" {
#   ami           = data.aws_ami.ubuntu.id
#   instance_type = var.instance_type
#   tags = {
#     Name = local.name_tag
#   }
#   depends_on = [aws_s3_bucket.my_bucket]
# }

# Modules
# provider "aws" {
#   region = var.aws_region
# }

# data "aws_ami" "ubuntu" {
#   most_recent = true
#   owners      = ["amazon"]
#   filter {
#     name   = "name"
#     values = ["amzn2-ami-hvm-*-x86_64-gp2"]
#   }
# }

# module "ec2_instance" {
#   source        = "./ec2_module"
#   ami_id        = data.aws_ami.ubuntu.id
#   instance_type = "t3.micro"
#   instance_name = "my modular ec2 instance"
#   }


# workspace
provider "aws" {
  region = var.aws_region
}

data "aws_ami" "ubuntu" {
  most_recent  =true
  owners = ["amazon"]
  filter {
    name = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "myec2" {
  ami =data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  tags = {
    Name= "EC2-${terraform.workspace}"
    Environment=terraform.workspace
  }
}

