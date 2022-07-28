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

variable asg_launch_template_version{
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

# variable "asg_instance_type" {
#   type        = string
#   description = "The type of the instance."

# }
# variable "asg_image_id" {
#   type        = string
#   description = " The AMI that can used to launch the instance"

# }