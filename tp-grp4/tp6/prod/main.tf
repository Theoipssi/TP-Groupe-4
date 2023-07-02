module "ec2module" {
  source = "../ec2module"

  environment = "prod"
  name        = "devops-ilyass"
  instance_type = "t2.micro"
}
