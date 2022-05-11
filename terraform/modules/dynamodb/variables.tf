variable "dd_table_name" {
  type        = string
  description = "DD table name"
}
variable "dd_hash_key" {
  type        = string
  description = "DD table hash key , this used for the partition key"
}
variable "dd_attributes_name" {
  type        = string
  description = " 	The attribute to use as the hash (partition) key. Must also be defined as an attribute"
}
variable "dd_attributes_type" {
  type        = string
  description = "type - (Required) Attribute type, which must be a scalar type: S, N, or B for (S)tring, (N)umber or (B)inary data"
}

variable "dd_read_capacity" {
  type        = number
  description = "The number of read units for this table"
}

variable "dd_write_capacity" {
  type        = number
  description = "The number of write units for this table. If the billing_mode is PROVISIONED,"
}

variable "all_tags" {
  type = map(string)

}