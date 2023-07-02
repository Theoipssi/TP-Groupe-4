provider "aws" {
    region = "us-east-1"
    access_key = "AKIA56SEMSCYS777K665"
    secret_key = "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"
}


variable "instance_type" {
  default = "t2.nano"
}

resource "aws_instance" "myec2" {
  ami           = "ami-06b09bfacae1453cb"
  instance_type = var.instance_type
  key_name      = "devops-ilyass"
  tags = {
    Name = "ec2-ilyass"
  }
}

resource "aws_eip" "myeip" {
  instance = aws_instance.myec2.id
}

resource "aws_security_group" "mysecuritygroup" {
  name        = "http/https"
  description = "autorisation du traffic"

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
}

resource "aws_network_interface_sg_attachment" "attachersecuritygroup" {
  security_group_id    = aws_security_group.mysecuritygroup.id
  network_interface_id = aws_instance.myec2.primary_network_interface_id
}
