terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

}

provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

module "vpc" {
  source          = "./modules/vpc"
  vpc_name        = "task1"
  vpc_cidr        = "10.0.0.0/16"
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
}

module "ec2" {
  source        = "./modules/ec2"
  ami           = "ami-0474ac020852b87a9"
  instance_name = "task1"
  instance_type = "t2.micro"
  subnet_id     = module.vpc.public_subnets[0]
  vpc_id        = module.vpc.vpc_id
  iam_instance_profile = module.iam.ec2_profile
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = "task1-v1"
}

# module "dynamoDB" {
#   source        = "./modules/dynamoDB"
#   table_name    = "task1"
#   hash_key      = "id"
#   hash_key_type = "S"
# }

# module "rds" {
#   identifier        = "rds-taks1"
#   source            = "./modules/rds"
#   db_name           = "task1"
#   allocated_storage = 20
#   engine            = "mysql"
#   engine_version    = "8.0.40"
#   instance_class    = "db.t3.micro"
#   username          = "admin"
#   password          = "admin123"
# }

module "iam" {
  source = "./modules/iam"
  bucket_arn = module.s3.bucket_arn
}