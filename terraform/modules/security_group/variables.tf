variable lb_sg_name_lb {
  type = string
}
variable lb_sg_name_ec2 {
type = string
}
variable lb_vpc_id {
  type = string
}

variable "all_tags" {
  description = "A map of tags to add to all resources"
  type        = map(any)
  default     = {}
}

variable "alb_tags" {
  description = "A map of tags to add to all resources"
  type        = map(any)
  default     = {
    Apply = "public"
  }
}


variable "ec2_tags" {
  description = "A map of tags to add to all resources"
  type        = map(any)
  default     = {
    Apply = "private"
  }
}


variable "lt_instance_type" {
  type        = string
  description = "The type of the instance."

}
variable "lt_image_id" {
  type        = string
  description = " The AMI that can used to launch the instance"

}



