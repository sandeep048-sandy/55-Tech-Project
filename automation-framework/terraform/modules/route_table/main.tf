variable "vpc_id" {}
variable "client_name" {}
variable "subnet_id" {}
variable "gateway_id" {}
variable "is_public" {}

resource "aws_route_table" "rt" {
  vpc_id = var.vpc_id
  tags = {
    Name = "${var.client_name}-${var.is_public ? "public" : "private"}-rt"
  }
}

resource "aws_route_table_association" "assoc" {
  subnet_id      = var.subnet_id
  route_table_id = aws_route_table.rt.id
}

resource "aws_route" "default" {
  route_table_id         = aws_route_table.rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = var.gateway_id
}

output "route_table_id" {
  value = aws_route_table.rt.id
}
