variable "ami" {
  type    = string
  default = ""
}

variable "instance_name" {
  type    = string
  default = ""
}

variable "instance_type" {
  type    = string
  default = ""
}

variable "subnet_id" {
  type    = string
  default = ""
}

variable "vpc_id" {
  type    = string
  default = ""

}

variable "iam_instance_profile" {
  type    = string
  default = ""
}