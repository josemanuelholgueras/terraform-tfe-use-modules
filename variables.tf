# Input variable definitions

variable "vpc_name" {
  description = "Name of VPC"
  type        = string
  default     = "example-vpc"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "134.0.0.0/16"
}

variable "vpc_azs" {
  description = "Availability zones for VPC"
  type        = list
  default     = ["ca-central-1a", "ca-central-1d"]
}

variable "vpc_private_subnets" {
  description = "Private subnets for VPC"
  type        = list(string)
  default     = ["134.0.1.0/24", "134.0.2.0/24"]
}

variable "vpc_public_subnets" {
  description = "Public subnets for VPC"
  type        = list(string)
  default     = ["134.0.101.0/24", "134.0.102.0/24"]
}

variable "vpc_enable_nat_gateway" {
  description = "Enable NAT gateway for VPC"
  type    = bool
  default = false
}

variable "resource_tags" {
  description = "Tags to apply to resources created by VPC module"
  type        = map(string)
    default                =  {
                                Terraform = "Instalacion terraform v0.12"
                                Environment = "DEVELOP"
                                App = "tel-test-module-app"
                              }

}
