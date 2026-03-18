output "frontend_public_ip" {
  value = module.ec2_frontend.public_ip
}

output "backend_private_ip" {
  value = module.ec2_backend.private_ip
}
