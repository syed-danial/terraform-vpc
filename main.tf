terraform {
  backend "s3" {
    bucket         = "danial-tf"
    key            = "terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "danial-tf"
  }
}

module "vpc" {
  source = "./modules/vpc-tf"
  name = var.name
  tags   = var.tags["VPC"]
  VPC = {
    vpc_cidr               = var.VPC.vpc_cidr
    web_subnet_cidr_blocks = var.VPC.web_subnet_cidr_blocks
    app_subnet_cidr_blocks = var.VPC.app_subnet_cidr_blocks
    db_subnet_cidr_blocks  = var.VPC.db_subnet_cidr_blocks
    create_nat_gateway     = var.VPC.create_nat_gateway
  }
}
