variable "region" {
  type        = string
  description = "AWS Region"
}

variable "name" {
  type        = string
  description = "Author of code"
}


variable "tags" {
  description = "Common tags for all resources"
  type        = map(map(string))
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
}
