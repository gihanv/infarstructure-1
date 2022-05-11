variable "lb_asg_name" {
  type        = string
  default     = "null"
  description = "aws autoscale group name"
}

variable "lb_vpc_id" {
  type        = string
  default     = "private"
  description = "VPV ID"
}

variable "lb_sg_name_alb" {
  type        = string
  default     = "sg_alb"
  description = "ALB security group name"

}
variable "lb_sg_name_acg" {
  type        = string
  default     = "null"
  description = "ALB security group name"

}

variable "lb_target_name" {
  type        = string
  default     = "null"
  description = "ALB traget group name"

}


variable "lb_pub_sg_tag" {
  type        = string
  default     = "public"
  description = "ALB security group name"

}
variable "lb_name" {
  type        = string
  default     = "public"
  description = "ALB  name"

}


variable "all_tags" {
  type = map(string)

}

