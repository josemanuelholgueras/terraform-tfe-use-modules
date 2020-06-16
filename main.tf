# Terraform configuration

provider "aws" {
  region = "ca-central-1"
}
/*
data "aws_security_group" "default" {
  name   = "default"
  vpc_id = module.vpc.vpc_id
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.39.0"
  # insert the 12 required variables here

  name = var.vpc_name

  cidr = var.vpc_cidr

  azs             = var.vpc_azs
  private_subnets = var.vpc_public_subnets
  public_subnets  = var.vpc_private_subnets

  enable_ipv6 = false

  enable_nat_gateway = var.vpc_enable_nat_gateway

  single_nat_gateway = false

  public_subnet_tags = {
    Name = "tel-module-name-public"
  }

  tags = var.resource_tags

  vpc_tags = {
    Name = "tel-module-vpc-name"
  }
}

locals {
  user_data = <<EOF
#!/bin/bash
echo "Hello Terraform from Telefonica TFE!"
EOF
}

data "aws_ami" "amazon_linux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name = "name"

    values = [
      "amzn-ami-hvm-*-x86_64-gp2",
    ]
  }

  filter {
    name = "owner-alias"

    values = [
      "amazon",
    ]
  }
}
*/
/*
module "ec2_instances" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.15.0"

  name           = "tel-module-ec2-cluster"
  instance_count = 0

  ami           = data.aws_ami.amazon_linux.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [module.vpc.default_security_group_id]
  subnet_id              = module.vpc.public_subnets[0]
  associate_public_ip_address = true

  user_data_base64 = base64encode(local.user_data)

  tags = var.resource_tags

}
*/

module "website_s3_bucket" {
  source  = "terraform.multicloud.telefonica.com/Telefonica/website_s3_bucket/modules"
  version = "2.0.0"

  bucket_name = "tel-module-tfe-example-version2"

  tags = var.resource_tags
}
