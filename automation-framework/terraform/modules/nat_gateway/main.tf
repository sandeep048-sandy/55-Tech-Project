variable "subnet_id" {}
variable "client_name" {}

resource "aws_eip" "nat" {
  vpc = true
  tags = {
    Name = "${var.client_name}-nat-eip"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = var.subnet_id
  tags = {
    Name = "${var.client_name}-nat-gw"
  }
}

output "nat_gateway_id" {
  value = aws_nat_gateway.nat.id
}
