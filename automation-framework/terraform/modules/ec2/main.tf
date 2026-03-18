variable "ami" {}
variable "instance_type" {}
variable "subnet_id" {}
variable "client_name" {}

resource "aws_instance" "app" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  tags = {
    Name = "${var.client_name}-app"
  }
}

output "instance_id" {
  value = aws_instance.app.id
}

output "public_ip" {
  value = aws_instance.app.public_ip
}

output "private_ip" {
  value = aws_instance.app.private_ip
}
