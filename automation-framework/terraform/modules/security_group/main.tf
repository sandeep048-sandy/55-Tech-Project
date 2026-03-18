variable "vpc_id" {}
variable "client_name" {}

resource "aws_security_group" "web" {
  name        = "${var.client_name}-web-sg"
  description = "Web security group"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.client_name}-web-sg"
  }
}

output "sg_id" {
  value = aws_security_group.web.id
}
