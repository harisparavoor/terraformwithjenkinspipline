module "Network" {
  source = "./Network"
  vpc_cidr = var.vpc_cidr
  public_subnet_a = var.public_subnet_a
  public_subnet_b = var.public_subnet_b
  private_subnet_a = var.private_subnet_a
  private_subnet_b = var.private_subnet_b
  project = var.project
  env = var.env
  region = var.region
  zone_a = var.zone_a
  zone_b = var.zone_b
  owner  = var.owner
}

module "EC2" {
  source = "./EC2"
  vpc_cidr = var.vpc_cidr
  public_subnet  = var.public_subnet_a
  private_subnet  = var.private_subnet_b
  project = var.project
  env = var.env
  region = var.region
  zone_a = var.zone_a
  zone_b = var.zone_b
  alb_name = var.alb_name
  owner    = var.owner
  public_ip = var.public_ip
 # instance_web2_id = var.instance_web2_id
  windows_ami = var.windows_ami
  public_key =  var.public_key
  amazon_linux_ami = var.amazon_linux_ami
  instance_type = var.instance_type
  instance_iam_profile = var.instance_iam_profile
  vpc_id = module.Network.vpc_id
  public_subnet_a_id = module.Network.TF-public_subnet_a_id
  public_subnet_b_id = module.Network.TF-public_subnet_b_id
  private_subnet_a_id = module.Network.TF-private_subnet_a_id
  private_subnet_b_id = module.Network.TF-private_subnet_b_id
}

  
