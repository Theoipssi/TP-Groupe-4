module "ec2module" {
  source = "../ec2module"

  environment   = "dev"
  name          = "devops-ilyass"
  instance_type = "t2.nano"
}
