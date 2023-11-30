data "aws_ami" "latest-amazon-linux-image" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "my_ec2_instance" {
  ami           = data.aws_ami.latest-amazon-linux-image.id
  instance_type = "t2.micro"
  key_name                    = "jenkin-server"
  user_data                   = file("jenkins-server-script.sh")
  associate_public_ip_address = true
  tags = {
    Name = "FirstEC2Instnace"
  }
}
