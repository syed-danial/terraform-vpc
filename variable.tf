variable "region" {
  type        = string
  description = "AWS Region"
  default = "us-west-2"
}

variable "name" {
  type        = string
  description = "Author of code"
  default = "danial"
}


variable "tags" {
  description = "Common tags for all resources"
  type        = map(map(string))
  default = {
    VPC = {
      defuse = "2023-08-15"
      cidr_block = "10.0.0.0/16"
    }
  }
}

variable "VPC" {
  description = "VPC Configuration"
  type = object({
    vpc_cidr               = string
    web_subnet_cidr_blocks = list(string)
    app_subnet_cidr_blocks = list(string)
    db_subnet_cidr_blocks  = list(string)
    create_nat_gateway     = bool
  })
  default = {
    vpc_cidr               = "10.0.0.0/16"
    web_subnet_cidr_blocks = ["10.0.0.0/24", "10.0.1.0/24"]
    app_subnet_cidr_blocks = ["10.0.2.0/24", "10.0.3.0/24"]
    db_subnet_cidr_blocks  = ["10.0.4.0/24", "10.0.5.0/24"]
    create_nat_gateway     = true
  }
}
