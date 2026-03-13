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
    Name= var.instance_name
  }
}