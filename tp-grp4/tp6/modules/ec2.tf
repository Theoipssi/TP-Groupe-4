provider "aws" {
  region     = "us-east-1"
  access_key = "AKIA56SEMSCYS777K665"
  secret_key = "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"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

data "aws_ami" "app_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "myec2" {
  ami           = data.aws_ami.app_ami.id
  instance_type = var.instance_type
  key_name      = "devops-ilyass"

  tags = {
    Name = "ilyass"
  }

  provisioner "local-exec" {
    command = "echo ${aws_instance.myec2.private_ip} >> private_ips.txt"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras install -y nginx",
      "sudo systemctl start nginx"
    ]
  }

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file("./devops-ilyass.pem")
  }

  vpc_security_group_ids = [aws_security_group.mysecuritygroup.id]
}

resource "aws_eip" "myeip" {
  instance = aws_instance.myec2.id
  domain   = "vpc"
}

resource "aws_security_group" "mysecuritygroup" {
  name        = "new-tp6"
  description = "authorization du traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
