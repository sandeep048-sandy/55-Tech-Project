variable "vpc_id" {}
variable "client_name" {}

resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id
  tags = {
    Name = "${var.client_name}-igw"
  }
}

output "igw_id" {
  value = aws_internet_gateway.igw.id
}
