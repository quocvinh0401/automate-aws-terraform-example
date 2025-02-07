variable "table_name" {
  description = "The name of the table"
  type        = string
  default     = ""
}

variable "hash_key" {
  description = "The attribute to use as the hash (partition) key"
  type        = string
  default     = ""

}

variable "hash_key_type" {
  description = "The type of the hash (partition) key"
  type        = string
  default     = ""

}