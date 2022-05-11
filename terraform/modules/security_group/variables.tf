variable sg_name_public {
  type = string
}
variable sg_name_private {
type = string
}
variable sg_vpc_id {
  type = string
}

variable "all_tags" {
  description = "A map of tags to add to all resources"
  type        = map(any)
  default     = {}
}

variable "sg_public_tags" {
  description = "A map of tags to add to all resources"
  type        = map(any)
  default     = {
    Apply = "public"
  }
}

variable "sg_private_tags" {
  description = "A map of tags to add to all resources"
  type        = map(any)
  default     = {
    Apply = "private"
  }
}




