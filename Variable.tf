
# REFERENCE FILE
# REGION

variable "region" {
    type         = string
    description  = "Paris region"
    default      = "eu-west-3"
}

# VPC CIDR cidr_block

variable "vpc-cidr" {
  type         = string
  default      = "10.0.0.0/16"
  description  = "vpc cidr"
    
}


variable "tag-post" {
  type         = string
  default      = "Wimble6_vpc"
  description  = "tag name"
    
}

# PUBLIC SUBNET1 variable

variable "Public-Subnet1"{
    type          = string
    description   = "Public-Subnet1 Cidr"
    default       = "10.0.1.0/24"
}

# PUBLIC SUBNET2 variable

variable "Public-Subnet2"{
    type          = string
    description   = "Public-Subnet2 Cidr"
    default       = "10.0.2.0/24"
}

# PRIVATE SUBNET1 variable

variable "Private-Subnet1"{
    type          = string
    description   = "Private-Subnet1 Cidr"
    default       = "10.0.3.0/24"
}

# PRIVATE SUBNET2 variable

variable "Private-Subnet2"{
    type          = string
    description   = "Private-Subnet2 Cidr"
    default       = "10.0.4.0/24"
    
}