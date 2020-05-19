resource "aws_dynamodb_table" "main" {
  name             = var.table_name
  billing_mode     = var.billing_mode
  hash_key         = var.hash_key
  range_key        = var.range_key

  dynamic "attribute" {
    for_each = local.processed_attributes
      content {
        name = attribute.value.name
        type = attribute.value.type
      }
  }

  lifecycle {
    ignore_changes = [read_capacity, write_capacity]
  }
}

locals {
  attributes = concat(
    [
      {
        name = var.range_key
        type = var.range_key_type
      },
      {
        name = var.hash_key
        type = var.hash_key_type
      }
    ],
    var.table_attributes
  )

  # If no `range_key` is provided, the first map will be removed from the list
  from_index = length(var.range_key) > 0 ? 0 : 1

  processed_attributes = slice(local.attributes, local.from_index, length(local.attributes))
}
