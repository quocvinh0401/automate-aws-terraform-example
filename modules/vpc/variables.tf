variable "vpc_name" {
  type    = string
  default = ""
}

variable "vpc_cidr" {
  type    = string
  default = ""
}

variable "public_subnets" {
  type    = list(string)
  default = []

}

variable "private_subnets" {
  type    = list(string)
  default = []

}

