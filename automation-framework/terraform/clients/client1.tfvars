vpc_cidr = "10.0.0.0/16"
client_name = "client1"
ami = "ami-0c55b159cbfafe1f0"
instance_type = "t2.micro"

# Public subnet (frontend)
public_subnet_cidr = "10.0.1.0/24"
public_subnet_az   = "us-east-1a"

# Private subnet (backend + DB)
private_subnet_cidr = "10.0.2.0/24"
private_subnet_az   = "us-east-1a"
