output "public_instance_id" {
  value = module.ec2.public_instance.id
}

output "private_instance_id" {
  value = module.ec2.private_instance.id
}
