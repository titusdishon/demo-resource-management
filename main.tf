# EC2 in us-east-1d
module "ec2_us_east" {
  source         = "./modules/ec2"
  providers      = { aws = aws.us_east }
  instance_type  = var.instance_type
  az             = "us-east-1d"
  key_name       = var.key_name
}

# EC2 in ap-south-1b
module "ec2_ap_south" {
  source         = "./modules/ec2"
  providers      = { aws = aws.ap_south }
  instance_type  = var.instance_type
  az             = "ap-south-1b"
  key_name       = var.key_name
}

# EC2 in eu-central-1b
module "ec2_eu_central" {
  source         = "./modules/ec2"
  providers      = { aws = aws.eu_central }
  instance_type  = var.instance_type
  az             = "eu-central-1b"
  key_name       = var.key_name
}

# ALB in eu-central-1b targeting EC2 instance in same AZ
module "alb_eu_central" {
  source              = "./modules/alb"
  providers           = { aws = aws.eu_central }
  target_instance_id  = module.ec2_eu_central.instance_id
  vpc_id              = module.ec2_eu_central.vpc_id
  subnet_id           = module.ec2_eu_central.subnet_id
}
