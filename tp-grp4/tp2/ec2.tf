provider "aws" {
    region = "us-east-1"
    access_key = "AKIA56SEMSCYS777K665"
    secret_key = "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"
}

resource "aws_instance" "myec2" {
  ami="ami-06b09bfacae1453cb"
  instance_type = "t2.micro"
  tags = {
    Name="ec2-ilyass"
  }
}

