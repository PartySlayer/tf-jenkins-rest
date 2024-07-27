variable "vpc_cidr_block" {
  description = "vpc cidr"
  default     = "10.0.0.0/16"
}

variable "public_cidr_blocks" {
    description = "CIDR of each pub subnet"
    type = list(string)
    default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_cidr_blocks" {
    description = "CIDR of each priv subnet"
    type = list(string)
    default     = ["10.0.3.0/24", "10.0.4.0/24"]
}