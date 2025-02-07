variable "allocated_storage" {
  description = "The amount of storage to allocate"
  type        = number
  default     = 20

}

variable "db_name" {
  description = "The name of the database to create"
  type        = string

}

variable "engine" {
  description = "The database engine to use"
  type        = string
  default     = "mysql"

}

variable "engine_version" {
  description = "The version of the database engine to use"
  type        = string
  default     = "8.0.40"

}

variable "instance_class" {
  description = "The instance class to use"
  type        = string
  default     = "db.t3.micro"

}

variable "username" {
  description = "The username for the database"
  type        = string

}

variable "password" {
  description = "The password for the database"
  type        = string

}

variable "identifier" {
  description = "The identifier for the database"
  type        = string

}