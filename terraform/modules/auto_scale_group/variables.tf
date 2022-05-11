variable "asg_vpc_id" {
  type        = string
  default     = ""
  description = "vpc id"
}

variable "asg_pvt_sg_tag" {
  type        = string
  default     = "private"
  description = "VPC specfic tag"
}

variable "asg_launch_template_name" {
  type        = string
  default     = ""
  description = "Lanch Template for ASG"

}
variable "asg_name" {
  type        = string
  description = "ASG name"

}

variable "asg_launch_template_version" {
  type        = string
  description = "sg_launch_template_version"

}


variable "asg_desired_capacity" {
  type        = number
  description = "desired_capacity of ASG"
  default     = 1
}

variable "asg_max_size" {
  type        = number
  description = "Max capacity of ASG"
  default     = 1
}


variable "asg_min_size" {
  type        = number
  description = "Min capacity of ASG"
  default     = 1
}

variable "asg_lb_tg_arn" {
  type    = string
  default = "arn:aws:elasticloadbalancing:us-east-1:724866671659:targetgroup/bestseller-autoscale-tg/f9490f7a85b66513"
}

