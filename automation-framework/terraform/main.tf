module "vpc" {
  source     = "./modules/vpc"
  vpc_cidr   = var.vpc_cidr
  client_name = var.client_name
}

module "igw" {
  source      = "./modules/igw"
  vpc_id      = module.vpc.vpc_id
  client_name = var.client_name
}

module "public_subnet" {
  source            = "./modules/public_subnet"
  vpc_id            = module.vpc.vpc_id
  cidr_block        = var.public_subnet_cidr
  availability_zone  = var.public_subnet_az
  client_name       = var.client_name
}

module "private_subnet" {
  source            = "./modules/private_subnet"
  vpc_id            = module.vpc.vpc_id
  cidr_block        = var.private_subnet_cidr
  availability_zone  = var.private_subnet_az
  client_name       = var.client_name
}

module "nat_gateway" {
  source      = "./modules/nat_gateway"
  subnet_id   = module.public_subnet.public_subnet_id
  client_name = var.client_name
}

module "public_route_table" {
  source      = "./modules/route_table"
  vpc_id      = module.vpc.vpc_id
  subnet_id   = module.public_subnet.public_subnet_id
  gateway_id  = module.igw.igw_id
  client_name = var.client_name
  is_public   = true
}

module "private_route_table" {
  source      = "./modules/route_table"
  vpc_id      = module.vpc.vpc_id
  subnet_id   = module.private_subnet.private_subnet_id
  gateway_id  = module.nat_gateway.nat_gateway_id
  client_name = var.client_name
  is_public   = false
}

module "security_group" {
  source     = "./modules/security_group"
  vpc_id     = module.vpc.vpc_id
  client_name = var.client_name
}

module "ec2_frontend" {
  source        = "./modules/ec2"
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = module.public_subnet.public_subnet_id
  client_name   = var.client_name
}

module "ec2_backend" {
  source        = "./modules/ec2"
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = module.private_subnet.private_subnet_id
  client_name   = var.client_name
}
