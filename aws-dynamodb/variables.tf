variable "table_name" {
  description = "Table name"
  type = string
}

variable "billing_mode" {
  description = "Valid values: PAY_PER_REQUEST or PROVISIONED"
  default     = "PAY_PER_REQUEST"
}

variable "hash_key" {
  description = "Table Hash Key"
  type        = string
}

variable "hash_key_type" {
  description = "Hash Key type. Valid values: `S`, `N`, or `B`"
  type        = string
  default     = "S"
}

variable "range_key" {
  description = "Table Range Key"
  type        = string
  default     = ""
}

variable "range_key_type" {
  description = "Range Key type. Valid values: `S`, `N`, or `B`"
  type        = string
  default     = "S"
}

variable "table_attributes" {
  description = "Additional attributes of table. It's a list of mapped values"
  type        = list(object({
    name = string
    type = string
  }))
  default     = []
}