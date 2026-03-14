data "aws_ami" "ami-id" {
  most_recent = true
  owners      = [ "099720109477" ]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

resource "aws_instance" "test" {
  ami           = data.aws_ami.ami-id.id
  instance_type = "t3.micro"

  tags = {
    Name = "created-by-actions"
  }
}