output "ec2_module" {  
  value = module.EC2.instance_web20_id
}
output "web2" {  
  value = module.EC2.instance_web2_id
}
output "vpc_id" {
  value      = module.Network.vpc_id
}
