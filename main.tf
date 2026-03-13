provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "myEc2" {
  ami           = "ami-073130f74f5ffb161"
  instance_type = "t3.micro"
  tags = {
    Name = "myFirstEc2"
  }
}
