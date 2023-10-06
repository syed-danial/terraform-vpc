region = "us-west-2"

tags = {
  environment = "dev"
  defuse      = "2023-09-15"
}

VPC = {
  vpc_cidr               = "10.0.0.0/16"
  web_subnet_cidr_blocks = ["10.0.0.0/24", "10.0.1.0/24"]
  app_subnet_cidr_blocks = ["10.0.2.0/24", "10.0.3.0/24"]
  db_subnet_cidr_blocks  = ["10.0.4.0/24", "10.0.5.0/24"]
  create_nat_gateway     = true
}

SG = {
  web_ports    = [80, 22]
  app_ports    = [4000, 22]
  db_ports     = 3306
  web_lb_ports = 80
  app_lb_ports = 80
}

rds = {
  db_name           = "test"
  db_masterusername = "admin"
  db_masterpassword = "adminadmin"
}

key = {
  public_key    = "terraform-danial.pub"
  key_pair_name = "terraform-danial"
}

launch_config = {
  instance_type = "t2.micro"
}

app_asg_config = {
  min_size         = 1
  max_size         = 1
  desired_capacity = 1
}

web_asg_config = {
  min_size         = 1
  max_size         = 4
  desired_capacity = 2
}

secret_manager_info = {
  username_name = "danial/3tier/username"
  password_name = "danial/3tier/password"
}