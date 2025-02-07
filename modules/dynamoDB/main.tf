resource "aws_dynamodb_table" "this" {
  name         = var.table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = var.hash_key
  range_key    = "created_at"

  attribute {
    name = var.hash_key
    type = var.hash_key_type
  }

  attribute {
    name = "created_at"
    type = "S"
  }
  tags = {
    Name = var.table_name
  }

}