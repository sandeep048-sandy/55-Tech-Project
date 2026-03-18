variable "vpc_id" {}
variable "cidr_block" {}
variable "availability_zone" {}
variable "client_name" {}

resource "aws_subnet" "private" {
  vpc_id            = var.vpc_id
  cidr_block        = var.cidr_block
  availability_zone = var.availability_zone
  map_public_ip_on_launch = false
  tags = {
    Name = "${var.client_name}-private-subnet"
  }
}

output "private_subnet_id" {
  value = aws_subnet.private.id
}
