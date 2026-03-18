variable "vpc_cidr" {}
variable "client_name" {}

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "${var.client_name}-vpc"
  }
}

output "vpc_id" {
  value = aws_vpc.main.id
}
